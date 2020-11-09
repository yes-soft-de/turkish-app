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
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class RealEstateService
{
    private $autoMapping;
    private $realEstateManager;
    private $reactionService;
    private $params;


    public function __construct(AutoMapping $autoMapping, RealEstateManager $realEstateManager, ReactionService $reactionService, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->realEstateManager = $realEstateManager;
        $this->reactionService = $reactionService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function realEstateCreate(RealEstateCreateRequest $request)
    {
        $create = $this->realEstateManager->RealEstateCreate($request);
        return $this->autoMapping->map(RealEstateEntity::class, RealEstateCreateResponse::class, $create);
    }

    public function getRealEstateById($request)
    {
        $result = $this->realEstateManager->getRealEstateById($request);

        $response = $this->autoMapping->map(RealEstateEntity::class, RealEstateGetByIdResponse::class, $result);

        return $response;
    }

    public function getAllRealEstate($entity, $userID)
    {
        $response = [];
        $result = $this->realEstateManager->getAllRealEstate();

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];
           
            $row['reaction']=$this->reactionService->reactionAll($row['id'], $entity);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;

            $response[] = $this->autoMapping->map('array', RealEstateGetAllResponse::class, $row);
        }

        return $response;
    }

    public function getRealEstateByUser($userID, $entity)
    {
        $response = [];
        $result = $this->realEstateManager->getRealEstateByUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $row['reaction']=$this->reactionService->reactionAll($row['id'], $entity);

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

    public function getFilter($key, $value)
    {
        $response = [];
        $result = $this->realEstateManager->getFilter($value, $key);
      
        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map('array', RealEstateGetFilterResponse::class, $row);
        }
        return $response;
    }
}
