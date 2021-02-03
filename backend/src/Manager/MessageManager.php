<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Request\ChatCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class MessageManager
{
    private $autoMapping;
    private $entityManager;
    private $statusManager;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, StatusManager $statusManager,
    CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
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

        $messageEntity = $this->autoMapping->map(ChatCreateRequest::class, MessageEntity::class, $request);

        $this->entityManager->persist($messageEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $messageEntity;

    }

}