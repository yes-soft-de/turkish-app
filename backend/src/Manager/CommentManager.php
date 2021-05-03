<?php
namespace App\Manager;

use App\AutoMapping;
use App\Entity\CommentEntity;
use App\Repository\CommentEntityRepository;
use App\Request\CommentCreateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class CommentManager
{
    private $entityManager;
    private $commentRepository;
    private $autoMapping;

    public function __construct(EntityManagerInterface $entityManagerInterface, CommentEntityRepository $commentRepository, AutoMapping $autoMapping) 
    {
        $this->entityManager = $entityManagerInterface;
        $this->commentRepository = $commentRepository;
        $this->autoMapping = $autoMapping;
    }

    public function create(CommentCreateRequest $request)
    {
        $commentEntity = $this->autoMapping->map(CommentCreateRequest::class, CommentEntity::class, $request);

        $this->entityManager->persist($commentEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $commentEntity;
    }

    public function delete(DeleteRequest $request)
    {
        $comment = $this->commentRepository->find($request->getId());

        if (!$comment) 
        {

        } 
        else 
        {
            $this->entityManager->remove($comment);
            $this->entityManager->flush();
        }

        return $comment;
    }

    public function getCommentsByEntityAndItemID($entity, $itemID)
    {
        return $this->commentRepository->getCommentsByEntityAndItemID($entity, $itemID);
    }

    public function getCommentsNumber($entity, $itemID)
    {
        return $this->commentRepository->getCommentsNumber($entity, $itemID);
    }

    public function getCommentsByUser($userID)
    {
        $comments = $this->commentRepository->getCommentsByUser($userID);

        // foreach($comments as $comment)
        // {
        //     if($comment['entity'] == "car")
        //     {

        //     }
        //     elseif($comment['entity'] == "device")
        //     {
                
        //     }
        //     elseif($row['entity'] == "realEstate")
        //     {
                
        //     }
        //     elseif($row['entity'] == "car")
        //     {
                
        //     }
        // }

        return $comments;
    }

}
