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

        return $this->autoMapping->map(DeviceEntity::class, DeviceCreateResponse::class, $deviceResult);
    }

    public function getDeviceById($id,$userID, $entity )
    { 
        $response = [] ;
        $result = $this->deviceManager->getDeviceById($id);

        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];
           
            $row['images'] = $this->imageService->getImages($id, $entity);
           
            $row['reaction']=$this->reactionService->reactionforItem($id, $entity);
            
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
              
            $response = $this->autoMapping->map('array', DeviceGetByIdResponse::class, $row);
           
            }
        
        return $response;
    }

    public function getDevicesOfUser($userID, $entity)
    {
        $response = [];
        $result = $this->deviceManager->getDevicesOfUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
            
            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $row);
        }

        return $response;
    }

    public function getAllDevices($entity, $userID)
    {
        $response = [];
        $result = $this->deviceManager->getAllDevices();
        
        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];
           
            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $entity);
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $response[] = $this->autoMapping->map('array', DeviceGetResponse::class, $row);
        }
        return $response;
    }

    public function update($request)
    {
        $deviceResult = $this->deviceManager->update($request);

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

    public function getFilter($key, $value)
    {
        $response = [];
        $result = $this->deviceManager->getFilter($value, $key);
      
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map('array', DevicesGetFilterResponse::class, $row);
        }
        return $response;
    }
}