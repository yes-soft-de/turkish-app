<?php

namespace App\Repository;

use App\Entity\ReactionEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReactionEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReactionEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReactionEntity[]    findAll()
 * @method ReactionEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReactionEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReactionEntity::class);
    }

    public function getAll($data ,$itemID)
    {
        return $this->createQueryBuilder('Reaction')
        ->andWhere('Reaction.itemID = :itemID')
        ->andWhere('Reaction.entity = :data')
        ->setParameter('itemID', $itemID)
        ->setParameter('data', $data)
        ->getQuery()
        ->getResult();
    }

    public function getReactionsForUser($userID)
    {
        return $this->createQueryBuilder('Reaction')
        ->andWhere('Reaction.createdBy = :userID')
        ->setParameter('userID', $userID)
        ->getQuery()
        ->getResult();
    }
}
