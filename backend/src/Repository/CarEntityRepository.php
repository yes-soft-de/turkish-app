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
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", 
            "car.distance", "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

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

    // public function getCarByIdUnaccepted($id)
    // {
    //     return $this->createQueryBuilder('car')
    //         ->select("car.id", "car.brand", "car.company", "car.yearOfRelease", "car.engine", "car.price", "car.description", "car.status",
    //             "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.cc", "car.fuel", "car.country",
    //             "car.city", "car.image", "car.specialLink", "car.state", 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

    //         ->andWhere('car.id = :id')

    //         ->setParameter('id', $id)

    //         ->leftJoin(
    //             UserProfileEntity::class,
    //             'userProfileEntity',
    //             Join::WITH,
    //             'userProfileEntity.userID = car.createdBy'
    //         )

    //         ->getQuery()
    //         ->getResult();
    // }

    public function getCarsOfUser($createdBy)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", 
            "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink",
             'userProfileEntity.userName', 'userProfileEntity.image as userImage')

            ->andWhere('car.createdBy = :createdBy')

            ->setParameter('createdBy', $createdBy)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->getQuery()
            ->getArrayResult();
    }

    public function getAllCars()
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", 
            "car.createdAt", "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.country", "car.city", "car.image", 
            "car.specialLink", "UserProfileEntity.image as userImage", "UserProfileEntity.userName")

            ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = car.createdBy'
            )

            ->getQuery()
            ->getResult();

    }

    public function getFilterCity($value)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", 
            "car.updateAt", "car.distance", "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 
            'userProfileEntity.userName', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->andWhere('car.city = :value')
            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", 
            "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->andWhere('car.price = :value')
            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getCarsByType($carType)
    {
        return $this->createQueryBuilder('car')
            ->select('car.id', 'car.createdBy', 'car.carType', 'car.createdAt', 'car.description', 'car.distance', 'car.gearType', 
            'car.image', 'car.price', 'car.yearOfProduction', 'car.status', 'car.updateAt', 'car.description', 'car.city', 'car.country', 
            'car.specialLink', "userProfileEntity.image as userImage", "userProfileEntity.userName")

            ->andWhere('car.carType LIKE :type')

            ->setParameter('type', '%'.$carType.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->orderBy('car.id')

            ->getQuery()
            ->getResult();
    }

    public function getFilterByPriceAndCity($price, $location)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", 
            "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->andWhere('car.price = :price')
            ->andWhere('car.city = :value')

            ->setParameter('price', $price)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPrices($price, $price_2)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", 
            "car.distance", "car.carType", "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName', 
            'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->andWhere('car.price >= :price')
            ->andWhere('car.price <= :price2')

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPricesAndCity($price, $price_2, $location)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", 
            "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->andWhere('car.price >= :price')
            ->andWhere('car.price <= :price2')
            ->andWhere('car.city = :value')

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getSoldCarsOfUser($userID)
    {
        return $this->createQueryBuilder('car')
            ->select('car.id', 'car.carType as itemName', 'car.completeDate as date')

            ->andWhere("car.status = 'sold'")

            ->andWhere('car.createdBy =:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getResult();
    }

    public function getCarOfUserById($userID, $id)
    {
        return $this->createQueryBuilder('car')
            ->select("car.id", "car.yearOfProduction", "car.price", "car.description", "car.status", "car.createdBy", "car.createdAt", "car.updateAt", "car.distance", "car.carType", 
            "car.gearType", "car.country", "car.city", "car.image", "car.specialLink", 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('car.id = :id')
            ->andWhere('car.createdBy = :userID')

            ->setParameter('id', $id)
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = car.createdBy'
            )

            ->getQuery()
            ->getResult();
    }
}
