<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\StatusEntity;
use App\Manager\StatusManager;
use App\Request\StatusCreateRequest;
use App\Response\StatusCreateResponse;
use App\Response\StatusUpdateResponse;
use App\Response\GetAgreementByIDResponse;
use App\Response\GetAgreementsResponse;

class StatusService
{
    private $autoMapping;
    private $statusManager;

    public function __construct(AutoMapping $autoMapping, StatusManager $statusManager)
    {
        $this->autoMapping = $autoMapping;
        $this->statusManager = $statusManager;
    }

    public function statusCreate(StatusCreateRequest $request)
    {
        $create = $this->statusManager->statusCreate($request);
        return $this->autoMapping->map(StatusEntity::class,StatusCreateResponse::class, $create);
    }

    public function statusUpdate( $userID ,$request)
    {
        $result = $this->statusManager->statusUpdate($userID, $request);
     
        return $this->autoMapping->map(StatusEntity::class, StatusUpdateResponse::class, $result);   
    }

    public function getAgreements($userID)
    {
        $respons = [];
        $item = $this->statusManager->getAgreements($userID);
        foreach($item as $row){
           $respons[] = $this->autoMapping->map(StatusEntity::class, GetAgreementsResponse::class, $row);
        }
        return $respons;
    }

    public function getAgreementID($ID)
    {
        $respons = [];
        $item = $this->statusManager->getAgreementID($ID);
        foreach($item as $row){
           $respons[] = $this->autoMapping->map(StatusEntity::class, GetAgreementByIDResponse::class, $row);
        }
        return $respons;
    }
}