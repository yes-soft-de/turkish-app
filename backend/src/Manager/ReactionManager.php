<?php
namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Repository\ReactionEntityRepository;
use App\Request\ReactionCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReactionManager
{
    private $entityManager;
    private $repository;
    private $autoMapping;

    public function __construct(EntityManagerInterface $entityManagerInterface,
    ReactionEntityRepository $repository, AutoMapping $autoMapping) {

        $this->entityManager = $entityManagerInterface;
        $this->repository = $repository;
        $this->autoMapping = $autoMapping;
    }
    public function reactionCreate(ReactionCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ReactionCreateRequest::class, ReactionEntity::class, $request);
        $entity->setCreatedAt();
    
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getAll($itemID)
    {
        return $this->repository->getAll($itemID);
    }

    public function getReactionsForUser($userID)
    {
        return $this->repository->getReactionsForUser($userID);
    }

    public function countInteractions($animeID)
    {
        return $this->interactionRepository->countInteractions($animeID);
    }

    public function loved($request)
    {
        return $this->interactionRepository->getAllLove($request->getID());
    }

    public function like($request)
    {
        return $this->interactionRepository->getAllLikes($request->getID());
    }

    public function dislike($request)
    {
        return $this->interactionRepository->getAllDislike($request->getID());
    }

    public function lovedAll($ID)
    {
        return $this->interactionRepository->getLoveAll($ID);
    }

    public function likeAll($ID)
    {
        return $this->interactionRepository->getLikeAll($ID);
    }

    public function dislikeAll($ID)
    {
        return $this->interactionRepository->dislikeAll($ID);
    }
}
