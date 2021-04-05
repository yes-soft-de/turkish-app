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
    private $commentService;

    public function __construct(AutoMapping $autoMapping, RealEstateManager $realEstateManager, ImageService $imageService, DocumentService $documentService, 
    ReactionService $reactionService, ParameterBagInterface $params, CommentService $commentService)
    {
        $this->autoMapping = $autoMapping;
        $this->realEstateManager = $realEstateManager;
        $this->reactionService = $reactionService;
        $this->imageService = $imageService;
        $this->documentService = $documentService;
        $this->commentService = $commentService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function realEstateCreate(RealEstateCreateRequest $request)
    {
        $create = $this->realEstateManager->RealEstateCreate($request);

        $create->setImage($this->specialLinkCheck($create->getSpecialLink()).$create->getImage());

        return $this->autoMapping->map(RealEstateEntity::class, RealEstateCreateResponse::class, $create);
    }

    public function getRealEstateById($id, $userID)
    {
        $response = [] ;
        $result = $this->realEstateManager->getRealEstateById($id);

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

            $row['comments'] = $this->commentService->getCommentsByEntityAndItemID("realEstate", $id);
           
            $response = $this->autoMapping->map('array', RealEstateGetByIdResponse::class, $row);
           
        }

        if($result)
        {
            $response->reaction['isLoved'] = $isLoved;
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

            $row['userImage'] = $this->params . $row['userImage'];
           
            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->realEstateManager->getRealEstateCommentsNumber($row['id'])[1];
          
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
            $row['userImage'] = $this->params . $row['userImage'];

            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->realEstateManager->getRealEstateCommentsNumber($row['id'])[1];

            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $row);
        }

        return $response;
    }

    public function realEstateUpdate($request)
    {
        $result = $this->realEstateManager->realEstateUpdate($request);

        $result->setImage($this->specialLinkCheck($result->getSpecialLink()).$result->getImage());

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

    public function getFilter($price, $price_2, $city)
    {
        $response = [];

        $result = $this->realEstateManager->getFilter($price, $price_2, $city);
      
        foreach ($result as $row)
        {
            $row['userImage'] = $this->params . $row['userImage'];

            $row['image'] = $this->params . $row['image'];

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $this->entity);
          
            $row['commentsNumber'] = $this->realEstateManager->getRealEstateCommentsNumber($row['id'])[1];

            $response[] = $this->autoMapping->map('array', RealEstateGetFilterResponse::class, $row);
        }

        return $response;
    }

    public function getRealEstatesByType($type)
    {
        $response = [];

        $realEstates = $this->realEstateManager->getRealEstatesByType($type);

        foreach ($realEstates as $realEstate)
        {
            $realEstate['image'] = $this->specialLinkCheck($realEstate['specialLink']) . $realEstate['image'];

            $realEstate['userImage'] = $this->specialLinkCheck($realEstate['specialLink']) . $realEstate['userImage'];

            $realEstate['reaction']=$this->reactionService->reactionforItem($realEstate['id'], $this->entity);
          
            $realEstate['commentsNumber'] = $this->realEstateManager->getRealEstateCommentsNumber($realEstate['id'])[1];
            
            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $realEstate);
        }

        return $response;
    }

    public function getSoldRealEstatesOfUser($userID)
    {
        $response = [];

        $soldRealEstates = $this->realEstateManager->getSoldRealEstatesOfUser($userID);
        
        foreach ($soldRealEstates as $realEstate)
        {
            $realEstate['image'] = $this->specialLinkCheck($realEstate['specialLink']) . $realEstate['image'];

            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $realEstate);
        }

        return $response;
    }
}
