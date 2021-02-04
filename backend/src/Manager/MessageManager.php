<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Repository\MessageEntityRepository;
use App\Request\ChatCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class MessageManager
{
    private $autoMapping;
    private $messageEntityRepository;
    private $entityManager;
    private $statusManager;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, StatusManager $statusManager,
    CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager, MessageEntityRepository $messageEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->messageEntityRepository = $messageEntityRepository;
        $this->statusManager = $statusManager;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
    }

    public function chatWithOwner(ChatCreateRequest $request)
    {
        $entity = $request->getEntity();
        
        if($entity == "car")
        {
            $carOwner = $this->carManager->getCarById($request->getItemID())[0]['createdBy'];

            $request->setUserTwo($carOwner);
        }
        elseif ($entity == "device")
        {
            $deviceOwner = $this->deviceManager->getDeviceById($request->getItemID())[0]['createdBy'];

            $request->setUserTwo($deviceOwner);
        }
        elseif ($entity == "realEstate")
        {
            $realEstateOwner = $this->realEstateManager->getRealEstateById($request->getItemID())[0]['createdBy'];

            $request->setUserTwo($realEstateOwner);
        }

        //Check if there is a previous chat for the both users

        $messageEntity = $this->messageEntityRepository->getChatByUsers($request->getUserOne(), $request->getUserTwo());

        if($messageEntity)
        {
            //dd($messageEntity);
            return $messageEntity;
        }

        else
        {
            $messageEntity = $this->autoMapping->map(ChatCreateRequest::class, MessageEntity::class, $request);

            $this->entityManager->persist($messageEntity);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $messageEntity;
        }

    }

    public function getChatListOfUser($userID)
    {
        $sentMessage = $this->messageEntityRepository->getSendMessagesList($userID);

        // $receivedMessage = $this->messageEntityRepository->getReceivedMessagesList($userID);

        // $chatList = array_merge($sentMessage, $receivedMessage);

        return $sentMessage;
    }

}