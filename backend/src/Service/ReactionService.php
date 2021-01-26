<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Manager\ReactionManager;
use App\Request\ReactionCreateRequest;
use App\Response\GetNotificationResponse;
use App\Response\ReactionCreateResponse;
use App\Response\ReactionGetByUserResponse;
use App\Response\ReactionGetResponse;

class ReactionService
{
    private $reactionManager;
    private $autoMapping;
//    private $carService;

    public function __construct(ReactionManager $reactionManager, AutoMapping $autoMapping)
    {
        $this->reactionManager = $reactionManager;
        $this->autoMapping = $autoMapping;
//        $this->carService = $carService;
    }
  
    public function reactionCreate(ReactionCreateRequest $request)
    {
        $create = $this->reactionManager->reactionCreate($request);
        return $this->autoMapping->map(ReactionEntity::class, ReactionCreateResponse::class, $create);

    }

    public function getAll($data, $itemID)
    {
        $result = $this->reactionManager->getAll($data, $itemID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map('array', ReactionGetResponse::class, $row);
        }

        return $response;
    }

    public function getReactionsForUser($userID)
    {
        $result = $this->reactionManager->getReactionsForUser($userID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map('array', ReactionGetResponse::class, $row);
        }

        return $response;
    }
    
    public function getReactionForUser($data, $itemID, $userID)
    {
        $result = $this->reactionManager->getReactionForUser($data, $itemID, $userID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map(ReactionEntity::class, ReactionGetByUserResponse::class, $row);
        }

        return $response;
    }

    public function reactionAll($ID, $entity)
    {
       return  $this->reactionManager->reactionAll($ID, $entity);
    }

    public function reactionforItem($ID, $entity)
    {
       return  $this->reactionManager->reactionforItem($ID, $entity);
    }

    public function getNotifications($userID)
    {
        $response = [];

        $reactions = $this->reactionManager->getNotifications($userID);

        foreach ($reactions as $reaction)
        {
            $response[] = $this->autoMapping->map('array', GetNotificationResponse::class, $reaction);
        }

        //dd($reactions);
        return $response;
    }
}