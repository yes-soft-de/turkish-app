<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\CommentEntity;
use App\Manager\CommentManager;
use App\Response\CommentCreateResponse;
use App\Response\CommentsGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CommentService
{
    private $commentManager;
    private $autoMapping;
    private $params;

    public function __construct(CommentManager $commentManager, AutoMapping $autoMapping, ParameterBagInterface $params)
    {
        $this->commentManager = $commentManager;
        $this->autoMapping = $autoMapping;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create($request)
    {
        $commentManager = $this->commentManager->create($request);

        return $this->autoMapping->map(CommentEntity::class, CommentCreateResponse::class, $commentManager);
    }

    public function delete($request)
    {
        $result = $this->commentManager->delete($request);

        $response = $this->autoMapping->map(CommentEntity::class, CommentCreateResponse::class, $result);

        if (!$response) 
        {
            return null;
        } 
        else 
        {
            return $response;
        }
    }

    public function getCommentsByEntityAndItemID($entity, $itemID)
    {
        $response = [];
        $result = $this->commentManager->getCommentsByEntityAndItemID($entity, $itemID);

        foreach ($result as $row) 
        {
            $row['image'] = $this->params.$row['image'];

            $response[] = $this->autoMapping->map('array', CommentsGetResponse::class, $row);
        }

        return $response;
    }

}
