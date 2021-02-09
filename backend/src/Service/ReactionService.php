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
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ReactionService
{
    private $reactionManager;
    private $autoMapping;
    private $params;

    public function __construct(ReactionManager $reactionManager, AutoMapping $autoMapping, ParameterBagInterface $params)
    {
        $this->reactionManager = $reactionManager;
        $this->autoMapping = $autoMapping;
        $this->params = $params->get('upload_base_url').'/';
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
            $reaction['userImage'] = $this->params . $reaction['userImage'];

            $response[] = $this->autoMapping->map('array', GetNotificationResponse::class, $reaction);
        }

        return $response;
    }

    public function checkUserLoved($id, $userID, $entity)
    {
        return $this->reactionManager->checkUserLoved($id, $userID, $entity);
    }

    public function removeReaction($userID, $entity, $itemID)
    {
        $reactionResult = $this->reactionManager->removeReaction($userID, $entity, $itemID);

        if($reactionResult == null)
        {
            return null;
        }

        return  $this->autoMapping->map(ReactionEntity::class, ReactionGetByUserResponse::class, $reactionResult);   
    }

    public function delete($id)
    {
        $reactionResult = $this->reactionManager->delete($id);

        if($reactionResult == null)
        {
            return null;
        }

        return  $this->autoMapping->map(ReactionEntity::class, ReactionGetByUserResponse::class, $reactionResult);
    }

}