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
    private $serviceManager;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;
    private $userManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ServicesManager $servicesManager,
    CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager, MessageEntityRepository $messageEntityRepository,
     UserManager $userManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->messageEntityRepository = $messageEntityRepository;
        $this->serviceManager = $servicesManager;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
        $this->userManager = $userManager;
    }

    public function chatWithOwner(ChatCreateRequest $request)
    {
        $entity = $request->getEntity();
        
        if($entity == "car")
        {
            $carOwner = $this->carManager->getCarById($request->getItemID())[0]['createdBy'];

            if($carOwner != $request->getUserOne())
            {
                $request->setUserTwo($carOwner);
            }
            elseif($carOwner == $request->getUserOne())
            {
                // return "Can't chat with yourself";
            }
            
        }
        elseif ($entity == "device")
        {
            $deviceOwner = $this->deviceManager->getDeviceById($request->getItemID())[0]['createdBy'];

            if($deviceOwner != $request->getUserOne())
            {
                $request->setUserTwo($deviceOwner);
            }
            elseif($deviceOwner == $request->getUserOne())
            {
                // return "Can't chat with yourself";
            }
            
        }
        elseif ($entity == "realEstate")
        {
            $realEstateOwner = $this->realEstateManager->getRealEstateById($request->getItemID())[0]['createdBy'];

            if($realEstateOwner != $request->getUserOne())
            {
                $request->setUserTwo($realEstateOwner);
            }
            elseif($realEstateOwner == $request->getUserOne())
            {
                // return "Can't chat with yourself";
            }
            
        }
        elseif ($entity == "service")
        {
            $serviceOwner = $this->serviceManager->getServicesById($request->getItemID())[0]['createdBy'];

            if($serviceOwner != $request->getUserOne())
            {
                $request->setUserTwo($serviceOwner);
            }
            elseif($serviceOwner == $request->getUserOne())
            {
                // return "Can't chat with yourself";
            }
            
        }

        //Check if there is a previous chat for the both users

        $messageEntity = $this->messageEntityRepository->getChatByUsers($request->getUserOne(), $request->getUserTwo());

        if(!$messageEntity)
        {
            $messageEntity = $this->messageEntityRepository->getChatByUsers($request->getUserTwo(), $request->getUserOne());
        }

        if($messageEntity)
        {
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

    public function chatWithLawyer(ChatCreateRequest $request)
    {
        $messageEntity = $this->messageEntityRepository->getChatByUsers($request->getUserOne(), $request->getUserTwo());

        if($messageEntity)
        {
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

        $receivedMessage = $this->messageEntityRepository->getReceivedMessagesList($userID);

        $chatList = array_merge($sentMessage, $receivedMessage);
        
        return $chatList;
    }

    public function deleteAllChatRequests()
    {
        return $this->messageEntityRepository->deleteAllChatRequests();
    }

    public function getAllChats()
    {
        $response = [];

        $lawyerUserID = $this->userManager->getLawyer()[0]['userID'];

        $response['total'] = count($this->messageEntityRepository->findAll());

        $response['chatsWithLawyer'] = count($this->getChatListOfUser($lawyerUserID));

        $response['chatsWithUsers'] = $response['total'] - $response['chatsWithLawyer'];

        return $response;
    }

}