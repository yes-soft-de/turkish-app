<?php

namespace App\Repository;

use App\Entity\CarEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CarEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method CarEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method CarEntity[]    findAll()
 * @method CarEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CarEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CarEntity::class);
    }

    public function getCarById($id): ?CarEntity
    {
        return $this->createQueryBuilder('car')
            ->andWhere('car.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getCarsOfUser($createdBy)
    {
        return $this->createQueryBuilder('car')
            ->andWhere('car.createdBy = :createdBy')
            ->setParameter('createdBy', $createdBy)
            ->getQuery()
            ->getArrayResult();
    }

    public function getAllCars()
    {
        return $this->createQueryBuilder('car')
            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterCompany($value)
    {
        return $this->createQueryBuilder('car')
            ->andWhere('car.company = :value')
            ->setParameter('value', $value)
            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('car')
            ->andWhere('car.price = :value')
            ->setParameter('value', $value)
            ->getQuery()
            ->getArrayResult();
    }
}
