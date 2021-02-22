<?php


namespace App\Manager;


use App\AutoMapping;
use Doctrine\ORM\EntityManagerInterface;

class MainManager
{
    private $autoMapping;
    private $statusManager;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;
    private $userManager;
    private $reactionManager;
    private $messageManager;
    private $statisticsID = 0;

    public function __construct(AutoMapping $autoMapping, StatusManager $statusManager, CarManager $carManager, 
     DeviceManager $deviceManager, RealEstateManager $realEstateManager, UserManager $userManager, 
     ReactionManager $reactionManager, MessageManager $messageManager)
    {
        $this->autoMapping = $autoMapping;
        $this->statusManager = $statusManager;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
        $this->userManager = $userManager;
        $this->reactionManager = $reactionManager;
        $this->messageManager = $messageManager;
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
                $response[$i]['itemName'] = $this->carManager->getCarById($status['itemID'])[0]['brand'];
            }
            elseif ($entity == "device")
            {
                $response[$i]['itemName'] = $this->deviceManager->getDeviceById($status['itemID'])[0]['brand'];
            }
            elseif ($entity == "realEstate")
            {
                $response[$i]['itemName'] = $this->realEstateManager->getRealEstateById($status['itemID'])[0]['realEstateType'];
            }

            $response[$i]['state'] = "Buy";

            $i++;
        }
        
        $cars = $this->carManager->getSoldCarsOfUser($userID);

        $devices = $this->deviceManager->getSoldDevicesOfUser($userID);

        $realEstates = $this->realEstateManager->getSoldRealEstatesOfUser($userID);

        $response2 = array_merge_recursive($cars, $devices, $realEstates, $response);
        
        return $response2;
    }

    public function getStatistics()
    {
        $response = [];

        $response['id'] = $this->statisticsID;
        
        $response['cars'] = count($this->carManager->getAllCars());

        $response['devices'] = count($this->deviceManager->getAllDevices());

        $response['realEstates'] = count($this->realEstateManager->getAllRealEstate());

        $response['properties'] = $response['cars'] + $response['devices'] + $response['realEstates'];

        $response['users'] = count($this->userManager->getAllusers());

        $response['reactions'] = $this->reactionManager->getAllReactions();

        $response['chats'] = $this->messageManager->getAllChats();

        $this->statisticsID++;

        return $response;
    }

}