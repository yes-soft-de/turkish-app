<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\DeviceEntity;
use App\Manager\DeviceManager;
use App\Request\DeviceCreateRequest;
use App\Response\DeviceCreateResponse;
use App\Response\DeviceGetByIdResponse;
use App\Response\DeviceGetResponse;
use App\Response\DevicesGetFilterResponse;
use App\Response\DeviceUpdateResponse;
use App\Service\ReactionService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class DeviceService
{
    private $autoMapping;
    private $deviceManager;
    private $reactionService;
    private $imageService;
    private $params;
    private $entity = "device";

    public function __construct(AutoMapping $autoMapping, DeviceManager $deviceManager, ReactionService $reactionService , ImageService $imageService ,ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->deviceManager = $deviceManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(DeviceCreateRequest $request)
    {
        $deviceResult = $this->deviceManager->create($request);

        $deviceResult->setImage($this->specialLinkCheck($deviceResult->getSpecialLink()).$deviceResult->getImage());

        return $this->autoMapping->map(DeviceEntity::class, DeviceCreateResponse::class, $deviceResult);
    }

    public function getDeviceById($id,$userID)
    { 
        $response = [] ;
        $result = $this->deviceManager->getDeviceById($id);

        $isLoved = $this->reactionService->checkUserLoved($id, $userID, $this->entity);

        foreach ($result as $row) 
        {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['userImage'] = $this->params . $row['userImage'];
           
            $row['images'] = $this->imageService->getImages($id, "device");
           
            $row['reaction']=$this->reactionService->reactionforItem($id, $this->entity);
            
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
              
            $response = $this->autoMapping->map('array', DeviceGetByIdResponse::class, $row);
           
        }

        if($result)
        {
            $response->reaction['isLoved'] = $isLoved;
        }
        
        return $response;
    }

    public function getDevicesOfUser($userID)
    {
        $response = [];
        $result = $this->deviceManager->getDevicesOfUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
            
            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $row);
        }

        return $response;
    }

    public function getAllDevices($userID)
    {
        $response = [];
        $result = $this->deviceManager->getAllDevices();
        
        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['imageUser'] = $this->params . $row['imageUser'];
           
            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $row);
        }
        return $response;
    }

    public function update($request)
    {
        $deviceResult = $this->deviceManager->update($request);

        $deviceResult->setImage($this->specialLinkCheck($deviceResult->getSpecialLink()).$deviceResult->getImage());

        return $this->autoMapping->map(DeviceEntity::class, DeviceUpdateResponse::class, $deviceResult);
    }

    public function delete($result)
    {
        $deviceResult = $this->deviceManager->delete($result);

        if($deviceResult == null)
        {
            return null;
        }

        return  $this->autoMapping->map(DeviceEntity::class, DeviceGetByIdResponse::class, $deviceResult);
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

    public function getFilter($price, $location)
    {
        $response = [];

        $result = $this->deviceManager->getFilter($price, $location);
      
        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map('array', DevicesGetFilterResponse::class, $row);
        }

        return $response;
    }

    public function getDevicesByBrand($brand)
    {
        $response = [];

        $devices = $this->deviceManager->getDevicesByBrand($brand);

        foreach ($devices as $device)
        {
            $device['image'] = $this->specialLinkCheck($device['specialLink']) . $device['image'];

            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $device);
        }

        return $response;
    }

    public function getSoldDevicesOfUser($userID)
    {
        $response = [];

        $soldDevices = $this->deviceManager->getSoldDevicesOfUser($userID);
        //dd($soldDevices);
        foreach ($soldDevices as $device)
        {
            $device['image'] = $this->specialLinkCheck($device['specialLink']) . $device['image'];

            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $device);
        }

        return $response;
    }
}