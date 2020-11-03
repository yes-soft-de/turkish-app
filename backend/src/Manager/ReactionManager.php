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
       
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getAll($data, $itemID)
    {
        return $this->repository->getAll($data, $itemID);
    }

    public function getReactionsForUser($userID)
    {
        return $this->repository->getReactionsForUser($userID);
    }

    public function getreactionForUser($data, $itemID, $userID)
    {
        return $this->repository->getreactionForUser($data, $itemID, $userID);
    }
}
