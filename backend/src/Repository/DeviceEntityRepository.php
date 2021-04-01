<?php

namespace App\Repository;

use App\Entity\DeviceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\UserProfileEntity;

/**
 * @method DeviceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method DeviceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method DeviceEntity[]    findAll()
 * @method DeviceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DeviceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DeviceEntity::class);
    }

    public $country;

    public function getDeviceById($id)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 'device.description', 
            'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('device.id = :id')

            ->setParameter('id', $id)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->getQuery()
            ->getResult();
    }

    public function getDevicesOfUser($createdBy)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 'device.description', 
            'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName', 'userProfileEntity.image as imageUser')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->andWhere('device.createdBy = :createdBy')
            ->setParameter('createdBy', $createdBy)

            ->getQuery()
            ->getArrayResult();
    }

    public function getAllDevices()
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type',
                 'device.price', 'device.description', 'device.status', 'device.createdAt','device.updateAt','device.country',
                 'device.city', 'UserProfileEntity.image as imageUser', 'UserProfileEntity.userName')

            ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = device.createdBy'
            )

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 'device.description', 
            'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->andWhere('device.price = :value')
            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterCity($value)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 
            'device.description', 'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->andWhere('device.city = :value')
            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getDevicesByBrand($brand)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.price', 'device.description', 'device.status', 'device.createdAt',
                'device.updateAt', 'device.country', 'device.city', 'device.createdBy', 'userProfileEntity.image as imageUser', 
                'userProfileEntity.userName')

            ->andWhere('device.brand LIKE :brand')

            ->setParameter('brand', '%'.$brand.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->orderBy('device.id')
            ->getQuery()
            ->getResult();
    }

    public function getFilterByPriceAndCity($price, $location)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 
            'device.description', 'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city',
            'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->andWhere('device.price = :price')
            ->andWhere('device.city = :value')

            ->setParameter('price', $price)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPrices($price, $price_2)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price',  'device.description', 
            'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )   

            ->andWhere('device.price >= :price')
            ->andWhere('device.price <= :price2')

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPricesAndCity($price, $price_2, $city)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type', 'device.createdBy', 'device.price', 'device.description', 
            'device.status', 'device.createdAt', 'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->andWhere('device.price >= :price')
            ->andWhere('device.price <= :price2')
            ->andWhere('device.city = :value')

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)
            ->setParameter('value', $city)

            ->getQuery()
            ->getArrayResult();
    }

    public function getSoldDevicesOfUser($userID)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.brand as itemName', 'device.completeDate as date')

            ->andWhere("device.status = 'sold'")

            ->andWhere('device.createdBy =:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getResult();
    }

    public function getDeviceOfUserById($userID, $id)
    {
        return $this->createQueryBuilder('device')
            ->select('device.id', 'device.specialLink', 'device.image','device.brand', 'device.type',
                'device.price', 'device.description', 'device.status', 'device.createdAt', 'device.createdBy',
                'device.updateAt', 'device.country', 'device.city', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('device.id = :id')
            ->andWhere('device.createdBy = :userID')

            ->setParameter('id', $id)
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = device.createdBy'
            )

            ->getQuery()
            ->getResult();
    }

}
