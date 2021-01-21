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

    public function __construct(AutoMapping $autoMapping, CarManager $carManager, ReactionService $reactionService, ImageService $imageService, DocumentService $documentService, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;
        $this->documentService = $documentService;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(CarCreateRequest $request)
    {
        $carResult = $this->carManager->create($request);

        return $this->autoMapping->map(CarEntity::class, CarCreateResponse::class, $carResult);
    }

    public function getCarById($id,$userID)
    { 
        $response = [] ;
        $result = $this->carManager->getCarById($id);
        
        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];
            $row['images'] = $this->imageService->getImages($id, $this->entity);

            $row['reaction']=$this->reactionService->reactionforItem($id, $this->entity);
    
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;

            $response = $this->autoMapping->map('array', CarGetByIdResponse::class, $row);
            }
            return $response;
    }

    public function getCarByIdUnaccepted($id, $userID)
    { 
        $response = [] ;
        $result = $this->carManager->getCarByIdUnaccepted($id);
        
        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];
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
            
            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
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
          
            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function update($request)
    {
        $carResult = $this->carManager->update($request);

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

    public function getFilter($key, $value)
    {
        $response = [];
        $result = $this->carManager->getFilter($value, $key);
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map('array', CarGetFilterResponse::class, $row);
        }
        return $response;
    }
}