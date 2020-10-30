<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Manager\ReactionManager;
use App\Request\ReactionCreateRequest;
use App\Response\ReactionCreateResponse;
use App\Response\ReactionGetResponse;

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

    public function getAll($data, $itemID)
    {
        $result = $this->reactionManager->getAll($data, $itemID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map(ReactionEntity::class, ReactionGetResponse::class, $row);
        }

        return $response;
    }

    public function getReactionsForUser($userID)
    {
        $result = $this->reactionManager->getReactionsForUser($userID);
        $response = [];
        foreach ($result as $row) {
            $response[] = $this->autoMapping->map(ReactionEntity::class, ReactionGetResponse::class, $row);
        }

        return $response;
    }

}