<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\StatusEntity;
use App\Manager\StatusManager;
use App\Request\StatusCreateRequest;
use App\Response\StatusCreateResponse;
use App\Response\StatusUpdateResponse;
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

    public function statusupdate($request)
    {
        $result = $this->statusManager->statusupdate($request);
     
        return $this->autoMapping->map(StatusEntity::class, StatusUpdateResponse::class, $result);   
    }

public function getAgreements($userID)
    {
        $item = $this->statusManager->getAgreements($userID);

        return $this->autoMapping->map(StatusEntity::class, GetAgreementsResponse::class, $item);
        
    }
}