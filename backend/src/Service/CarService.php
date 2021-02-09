<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Manager\CarManager;
use App\Request\CarCreateRequest;
use App\Request\GetByIdRequest;
use App\Response\CarCreateResponse;
use App\Response\CarGetByIdResponse;
use App\Response\CarGetResponse;
use App\Response\CarGetFilterResponse;
use App\Response\CarUpdateResponse;
use App\Service\ReactionService;
use App\Service\ImageService;
use App\Service\DocumentService;

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CarService
{
    private $autoMapping;
    private $carManager;
    private $reactionService;
    private $imageService;
    private $documentService;
    private $params;
    private $entity = "car";
    private $deviceService;
    private $realEstateService;

    public function __construct(AutoMapping $autoMapping, CarManager $carManager, ReactionService $reactionService, ImageService $imageService,
                                DocumentService $documentService, ParameterBagInterface $params, DeviceService $deviceService, RealEstateService $realEstateService)
    {
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;
        $this->documentService = $documentService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(CarCreateRequest $request)
    {
        $carResult = $this->carManager->create($request);

        $carResult->setImage($this->specialLinkCheck($carResult->getSpecialLink()).$carResult->getImage());

        return $this->autoMapping->map(CarEntity::class, CarCreateResponse::class, $carResult);
    }

    public function getCarById($id,$userID)
    { 
        $response = [] ;
        $result = $this->carManager->getCarById($id);

        $isLoved = $this->reactionService->checkUserLoved($id, $userID, $this->entity);
        
        foreach ($result as $row)
        {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['userImage'] = $this->params . $row['userImage'];

            $row['images'] = $this->imageService->getImages($id, $this->entity);

            $row['reaction'] = $this->reactionService->reactionforItem($id, $this->entity)[0];
            
            ($row['reaction']['createdBy'] == $userID) ?  $row['reaction']['createdBy'] = true : $row['reaction']['createdBy'] = false ;

            $response = $this->autoMapping->map('array', CarGetByIdResponse::class, $row);
        }
        if($result)
        {
            $response->reaction['isLoved'] = $isLoved;
        }
            return $response;
    }

    public function getCarByIdUnaccepted($id, $userID)
    { 
        $response = [] ;
        $result = $this->carManager->getCarByIdUnaccepted($id);
        
        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['userImage'] = $this->params . $row['userImage'];

            $row['images'] = $this->imageService->getImages($id, $this->entity);

            $row['documents'] = $this->documentService->getDocuments($id, $this->entity);

            $response = $this->autoMapping->map('array', CarGetByIdResponse::class, $row);
            }
            return $response;
      
    }

    public function getCarsOfUser($userID)
    {
        $response = [];
        $result = $this->carManager->getCarsOfUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function getAllCars($userID)
    {
        $response = [];
        $result = $this->carManager->getAllCars();

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];
            $row['imageUser'] = $this->params . $row['imageUser'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
            //dd($row['reaction']);
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function getAllCarsUnaccepted($userID)
    {
        $response = [];
        $result = $this->carManager->getAllCarsUnaccepted();

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['imageUser'] = $this->params . $row['imageUser'];
          
            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function update($request)
    {
        $carResult = $this->carManager->update($request);

        $carResult->setImage($this->specialLinkCheck($carResult->getSpecialLink()).$carResult->getImage());

        return $this->autoMapping->map(CarEntity::class, CarUpdateResponse::class, $carResult);
    }

    public function delete($result)
    {
        $carResult = $this->carManager->delete($result);

        if($carResult == null)
        {
            return null;
        }
        return  $this->autoMapping->map(CarEntity::class, CarGetByIdResponse::class, $carResult);
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

    public function getFilter($price, $price_2, $location)
    {
        $response = [];

        $result = $this->carManager->getFilter($price, $price_2, $location);

        foreach ($result as $row)
        {
            $row['userImage'] = $this->params . $row['userImage'];

            $row['image'] = $this->params . $row['image'];

            $response[] = $this->autoMapping->map('array', CarGetFilterResponse::class, $row);
        }

        return $response;
    }

    public function getAllProperties($userID)
    {
        $response = [];

        $cars = $this->getAllCars($userID);

        $devices = $this->deviceService->getAllDevices($userID);

        $realEstates = $this->realEstateService->getAllRealEstate($userID);

        $response = array_merge_recursive($cars, $devices, $realEstates);

        //dd($response);

        shuffle($response);

        return $response;
    }

    public function getCarsByBrand($brand)
    {
        $response = [];

        $cars = $this->carManager->getCarsByBrand($brand);

        foreach ($cars as $car)
        {
            $car['image'] = $this->specialLinkCheck($car['specialLink']) . $car['image'];

            $car['imageUser'] = $this->specialLinkCheck($car['specialLink']) . $car['imageUser'];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $car);
        }

        return $response;
    }

    public function getSoldCarsOfUser($userID)
    {
        $response = [];

        $soldCars = $this->carManager->getSoldCarsOfUser($userID);
        //dd($soldCars);
        foreach ($soldCars as $car)
        {
            $car['image'] = $this->specialLinkCheck($car['specialLink']) . $car['image'];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $car);
        }

        return $response;
    }

}