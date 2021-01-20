<?php

namespace App\Repository;

use App\Entity\CarEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\UserProfileEntity;

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

    public function getCarById($id)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country", "car.city", "car.image", "car.specialLink")

            ->andWhere('car.id = :id')

            ->setParameter('id', $id)

            ->getQuery()
            ->getResult();
    }

    public function getCarByIdUnaccepted($id)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country", "car.city", "car.image", "car.specialLink", "car.state")

            ->andWhere('car.id = :id')

            ->setParameter('id', $id)

            ->getQuery()
            ->getResult();
    }

    public function getCarsOfUser($createdBy)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country", "car.city", "car.image", "car.specialLink")

            ->andWhere('car.createdBy = :createdBy')

            ->setParameter('createdBy', $createdBy)

            ->getQuery()
            ->getArrayResult();
    }

    public function getAllCars()
    {
        return $this->createQueryBuilder('car')
              ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country", "car.city", "car.image", "car.specialLink", "UserProfileEntity.image as imageUser", "car.state")

              ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = car.createdBy'
            )

              ->andWhere("car.state = 'Accepted'")

              ->getQuery()
              ->getResult();
    }
    public function getAllCarsUnaccepted()
    {
        return $this->createQueryBuilder('car')
              ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country", "car.city", "car.image", "car.specialLink", "UserProfileEntity.image as imageUser", "car.state")

              ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = car.createdBy'
            )

              ->andWhere("car.state = 'Unaccepted'")

              ->getQuery()
              ->getResult();
    }

    public function getFilterCity($value)
    {
        return $this->createQueryBuilder('car')

            ->andWhere('car.city = :value')
            ->andWhere("car.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('car')

            ->andWhere('car.price <= :value')
            ->andWhere("car.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }
}
