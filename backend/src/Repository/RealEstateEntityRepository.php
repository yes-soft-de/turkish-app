<?php

namespace App\Repository;

use App\Entity\RealEstateEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method RealEstateEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method RealEstateEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method RealEstateEntity[]    findAll()
 * @method RealEstateEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RealEstateEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RealEstateEntity::class);
    }

    public function getRealEstateById($id)
    {

        return $this->createQueryBuilder('RealEstateEntity')
            ->andWhere('RealEstateEntity.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAllRealEstate()
    {
        $r =  $this->createQueryBuilder('RealEstateEntity')
            ->getQuery()
            ->getArrayResult();

        dd($r);
        return $r;

    }

    public function getRealEstateByUser($userID)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->andWhere('RealEstateEntity.createdBy = :userID')
            ->setParameter('userID', $userID)
            ->getQuery()
            ->getResult();
    }

    public function getFilterLocation($value)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->andWhere('RealEstateEntity.location = :value')
            ->setParameter('value', $value)
            ->getQuery()
            ->getArrayResult();
    }
    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->andWhere('RealEstateEntity.price >= :value')
            ->setParameter('value', $value)
            ->getQuery()
            ->getArrayResult();
    }
   
}
