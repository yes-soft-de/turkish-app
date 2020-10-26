<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Manager\ReactionManager;
use App\Request\ReactionCreateRequest;
use App\Response\ReactionCreateResponse;
use App\Response\GetReactionResponse;

class ReactionService
{
    private $reactionManager;
    private $autoMapping;
    private $gradeService;
    private $updateGradeRequest;

    public function __construct(ReactionManager $reactionManager, AutoMapping $autoMapping)
    {
        $this->reactionManager = $reactionManager;
        $this->autoMapping = $autoMapping;
    }
  
    public function reactionCreate(ReactionCreateRequest $request)
    {
        $create = $this->reactionManager->reactionCreate($request);
        return $this->autoMapping->map(ReactionEntity::class, ReactionCreateResponse::class, $create);

    }

    
    public function getAll($itemID)
    {
        $result = $this->reactionManager->getAll($itemID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map(ReactionEntity::class, GetReactionResponse::class, $row);
        }

        return $response;
    }

    public function getReactionsForUser($userID)
    {
        $result = $this->reactionManager->getReactionsForUser($userID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map(ReactionEntity::class, GetReactionResponse::class, $row);
        }

        return $response;
    }

    public function countInteractions($request)
    {
        return $this->interactionManager->countInteractions($request);
    }

    public function loved($request)
    {
       return $this->interactionManager->loved($request)[1];
    }

    public function like($request)
    {
        return $this->interactionManager->like($request)[1];
    }

    public function dislike($request)
    {
        return $this->interactionManager->dislike($request)[1];
    }

    public function lovedAll($ID)
    {
       return  $this->interactionManager->lovedAll($ID)[1];
    }

    public function likeAll($ID)
    {
       return  $this->interactionManager->likeAll($ID)[1];
    }

    public function dislikeAll($ID)
    {
       return  $this->interactionManager->dislikeAll($ID)[1];
    }
}