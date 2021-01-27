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
              ->andWhere('Status.createdBy = :userID')
              ->setParameter('userID', $userID)
              ->getQuery()
              ->getResult();            
    }

    public function findByUserIDAndID($userID, $ID)
    {
        return $this->createQueryBuilder('Status')
              ->andWhere('Status.createdBy = :userID')
              ->andWhere('Status.id = :ID')
              ->setParameter('userID', $userID)
              ->setParameter('ID', $ID)
              ->getQuery()
              ->getOneOrNullResult();            
    }

    public function getAgreementID($ID)
    {
        return $this->createQueryBuilder('Status')
              ->andWhere('Status.id = :ID')
              ->setParameter('ID', $ID)
              ->getQuery()
              ->getResult();            
    }

    public function getFinishedAgreementsOfUser($userID)
    {
        return $this->createQueryBuilder('status')
            ->select('status.createdAt', 'status.createdBy', 'status.status', 'status.entity', 'status.itemID')

            ->andWhere("status.status = 'Finished'")

            ->andWhere('status.createdBy =:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getResult();
    }

}
