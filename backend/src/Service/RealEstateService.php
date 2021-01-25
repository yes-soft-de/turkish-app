<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\RealEstateEntity;
use App\Manager\RealEstateManager;
use App\Request\RealEstateCreateRequest;
use App\Response\RealEstateGetAllResponse;
use App\Response\RealEstateGetByIdResponse;
use App\Response\RealEstateGetFilterResponse;
use App\Response\RealEstateCreateResponse;
use App\Response\RealEstateUpdateResponse;
use App\Service\ReactionService;
use App\Service\ImageService;
use App\Service\DocumentService;

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class RealEstateService
{
    private $autoMapping;
    private $realEstateManager;
    private $reactionService;
    private $imageService;
    private $documentService;
    private $params;
    private $entity = "realEstate";

    public function __construct(AutoMapping $autoMapping, RealEstateManager $realEstateManager, ImageService $imageService, DocumentService $documentService, ReactionService $reactionService, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->realEstateManager = $realEstateManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;
        $this->documentService = $documentService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function realEstateCreate(RealEstateCreateRequest $request)
    {
        $create = $this->realEstateManager->RealEstateCreate($request);
        return $this->autoMapping->map(RealEstateEntity::class, RealEstateCreateResponse::class, $create);
    }

    public function getRealEstateById($id,$userID)
    {
        $response = [] ;
        $result = $this->realEstateManager->getRealEstateById($id);
     
        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];
          
            $row['images'] = $this->imageService->getImages($id, $this->entity);

            $row['reaction']=$this->reactionService->reactionforItem($id, $this->entity);
        
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
           
            $response = $this->autoMapping->map('array', RealEstateGetByIdResponse::class, $row);
           
            }
        return $response;
    }

    public function getRealEstateByIdUnaccepted($id,$userID)
    {
        $response = [] ;
        $result = $this->realEstateManager->getRealEstateByIdUnaccepted($id);
     
        foreach ($result as $row) {

            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];
          
            $row['images'] = $this->imageService->getImages($id, $this->entity);
            $row['documents'] = $this->documentService->getDocuments($id, $this->entity);
           
            $response = $this->autoMapping->map('array', RealEstateGetByIdResponse::class, $row);
           
            }
        return $response;
    }

    public function getAllRealEstate($userID)
    {
        $response = [];
        $result = $this->realEstateManager->getAllRealEstate();
        
        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['imageUser'] = $this->params . $row['imageUser'];
           
            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $row);
        }

        return $response;
    }

    public function getAllRealEstateUnaccepted($userID)
    {
        $response = [];
        $result = $this->realEstateManager->getAllRealEstateUnaccepted();
        
        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['imageUser'] = $this->params . $row['imageUser'];
                      
            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $row);
        }

        return $response;
    }

    public function getRealEstateByUser($userID)
    {
        $response = [];
        $result = $this->realEstateManager->getRealEstateByUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;

            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $row);
        }

        return $response;
    }

    public function realEstateUpdate($request)
    {
        $result = $this->realEstateManager->realEstateUpdate($request);

        return $this->autoMapping->map(RealEstateEntity::class, RealEstateUpdateResponse::class, $result);
    }

    public function delete($request)
    {
        $result = $this->realEstateManager->delete($request);

        return $this->autoMapping->map(RealEstateEntity::class, RealEstateGetByIdResponse::class, $result);
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

        $result = $this->realEstateManager->getFilter($price, $location);
      
        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map('array', RealEstateGetFilterResponse::class, $row);
        }

        return $response;
    }

    public function getRealEstatesByType($type)
    {
        $response = [];

        $cars = $this->realEstateManager->getRealEstatesByType($type);

        foreach ($cars as $car)
        {
            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $car);
        }

        return $response;
    }
}
