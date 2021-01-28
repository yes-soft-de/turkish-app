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
            ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description",
                "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel",
                "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('car.id = :id')

            ->setParameter('id', $id)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->getQuery()
            ->getResult();
    }

    public function getCarByIdUnaccepted($id)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status",
                "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country",
                "car.city", "car.image", "car.specialLink", "car.state", 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('car.id = :id')

            ->setParameter('id', $id)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

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
              ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description",
                  "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc",
                  "car.fuel", "car.country", "car.city", "car.image", "car.specialLink", "UserProfileEntity.image as imageUser", "UserProfileEntity.userName", "car.state")

              ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = car.createdBy'
            )

//              ->andWhere("car.state = 'Accepted'")

              ->getQuery()
              ->getResult();
    }
    public function getAllCarsUnaccepted()
    {
        return $this->createQueryBuilder('car')
              ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status",
                  "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country",
                  "car.city", "car.image", "car.specialLink", "UserProfileEntity.image as imageUser", "UserProfileEntity.userName", "car.state")

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

    public function getCarsByBrand($brand)
    {
        return $this->createQueryBuilder('car')
            ->select('car.id', 'car.brand', 'car.createdBy', 'car.carType', 'car.cc', 'car.company', 'car.createdAt', 'car.description', 'car.distance',
            'car.engine', 'car.fuel', 'car.gearType', 'car.image', 'car.price', 'car.yearOfRelease', 'car.status', 'car.updateAt', 'car.state', 'car.description',
             'car.city', 'car.country', 'car.specialLink', "userProfileEntity.image as imageUser", "userProfileEntity.userName")

            ->andWhere('car.brand LIKE :brand')

            ->setParameter('brand', '%'.$brand.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->orderBy('car.id')

            ->getQuery()
            ->getResult()
            ;
    }

    public function getFilterByPriceAndCity($price, $location)
    {
        return $this->createQueryBuilder('car')

            ->andWhere('car.price <= :price')
            ->andWhere('car.city = :value')
            ->andWhere("car.state = 'Accepted'")

            ->setParameter('price', $price)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getSoldCarsOfUser($userID)
    {
        return $this->createQueryBuilder('car')
            ->select('car.id', 'car.brand as itemName', 'car.completeDate as date')

            ->andWhere("car.status = 'sold'")

            ->andWhere('car.createdBy =:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getResult();
    }
}
