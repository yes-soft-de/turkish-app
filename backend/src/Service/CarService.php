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
    private $commentService;

    public function __construct(AutoMapping $autoMapping, CarManager $carManager, ReactionService $reactionService, ImageService $imageService,
        DocumentService $documentService, ParameterBagInterface $params, DeviceService $deviceService, RealEstateService $realEstateService, CommentService $commentService)
    {
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;
        $this->documentService = $documentService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;
        $this->commentService = $commentService;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(CarCreateRequest $request)
    {
        $carResult = $this->carManager->create($request);

        $carResult->setImage($this->specialLinkCheck($carResult->getSpecialLink()).$carResult->getImage());

        return $this->autoMapping->map(CarEntity::class, CarCreateResponse::class, $carResult);
    }

    public function getCarById($id, $userID)
    { 
        $response = [] ;
        $result = $this->carManager->getCarById($id);

        $isLoved = $this->reactionService->checkUserLoved($id, $userID, $this->entity);
        
        foreach ($result as $row)
        {
            if((is_string($userID) && $row['createdBy'] != $userID) || (is_int($userID) && $userID == 0))
            {
                $row['editable'] = false;
            }
            elseif(is_string($userID) && $row['createdBy'] == $userID)
            {
                $row['editable'] = true;
            }

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $row['userImage'] = $this->params . $row['userImage'];

            $row['images'] = $this->imageService->getImages($id, $this->entity);

            $row['reaction'] = $this->reactionService->reactionforItem($id, $this->entity)[0];
            
            ($row['reaction']['createdBy'] == $userID) ?  $row['reaction']['createdBy'] = true : $row['reaction']['createdBy'] = false ;

            $row['comments'] = $this->commentService->getCommentsByEntityAndItemID("car", $id);

            $response = $this->autoMapping->map('array', CarGetByIdResponse::class, $row);
        }
        if($result)
        {
            $response->reaction['isLoved'] = $isLoved;
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

            $row['userImage'] = $this->params . $row['userImage'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->carManager->getCarCommentsNumber($row['id'])[1];

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
            $row['userImage'] = $this->params . $row['userImage'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
            
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->carManager->getCarCommentsNumber($row['id'])[1];

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

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
          
            $row['commentsNumber'] = $this->carManager->getCarCommentsNumber($row['id'])[1];

            $response[] = $this->autoMapping->map('array', CarGetFilterResponse::class, $row);
        }

        return $response;
    }

    // public function getAllProperties($userID)
    // {
    //     $response = [];

    //     $cars = $this->getAllCars($userID);

    //     $devices = $this->deviceService->getAllDevices($userID);

    //     $realEstates = $this->realEstateService->getAllRealEstate($userID);

    //     $response = array_merge_recursive($cars, $devices, $realEstates);

    //     shuffle($response);

    //     return $response;
    // }

    public function getCarsByType($brand)
    {
        $response = [];

        $cars = $this->carManager->getCarsByType($brand);

        foreach ($cars as $car)
        {
            $car['image'] = $this->specialLinkCheck($car['specialLink']) . $car['image'];

            $car['userImage'] = $this->specialLinkCheck($car['specialLink']) . $car['userImage'];

            $car['reaction']=$this->reactionService->reactionforItem($car['id'], $this->entity);
          
            $car['commentsNumber'] = $this->carManager->getCarCommentsNumber($car['id'])[1];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $car);
        }

        return $response;
    }

    public function getSoldCarsOfUser($userID)
    {
        $response = [];

        $soldCars = $this->carManager->getSoldCarsOfUser($userID);
        
        foreach ($soldCars as $car)
        {
            $car['image'] = $this->specialLinkCheck($car['specialLink']) . $car['image'];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $car);
        }

        return $response;
    }

}