<?php

namespace App\Repository;

use App\Entity\StatusEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method StatusEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method StatusEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method StatusEntity[]    findAll()
 * @method StatusEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StatusEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StatusEntity::class);
    }

    public function getAgreements($userID)
    {
        return $this->createQueryBuilder('Status')
              ->andWhere('Status.userID = :userID')
              ->setParameter('userID', $userID)
              ->getQuery()
              ->getOneOrNullResult();            
    }

}
