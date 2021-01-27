<?php


namespace App\Manager;


use App\AutoMapping;
use Doctrine\ORM\EntityManagerInterface;

class MainManager
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

    public function getHistory($userID)
    {
        $i = 0;
        $response = [];

        $userStatus = $this->statusManager->getFinishedAgreementsOfUser($userID);

        foreach($userStatus as $status)
        {
            $entity = $status['entity'];

            $response[] = $status;

            if ($entity == "car")
            {
                $response[$i]['entity'] = $this->carManager->getCarById($status['itemID'])[0]['brand'];
            }
            elseif ($entity == "device")
            {
                $response[$i]['entity'] = $this->deviceManager->getDeviceById($status['itemID'])[0]['brand'];
            }
            elseif ($entity == "realEstate")
            {
                $response[$i]['entity'] = $this->realEstateManager->getRealEstateById($status['itemID'])[0]['realEstateType'];
            }

            $response[$i]['state'] = "Bought";

            $i++;

        }

        $cars = $this->carManager->getSoldCarsOfUser($userID);

        $devices = $this->deviceManager->getSoldDevicesOfUser($userID);

        $realEstates = $this->realEstateManager->getSoldRealEstatesOfUser($userID);

        $response2 = array_merge_recursive($cars, $devices, $realEstates, $response);

        return $response2;
    }

}