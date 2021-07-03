<?php

namespace App\Repository;

use App\Entity\CategoryEntity;
use App\Entity\ServicesEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\UserProfileEntity;

/**
 * @method ServicesEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ServicesEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ServicesEntity[]    findAll()
 * @method ServicesEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ServicesEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ServicesEntity::class);
    }

    public function getServicesById($serviceID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.id = :id')
            ->setParameter('id', $serviceID)

            ->getQuery()
            ->getResult();
    }

    public function getAllServices()
    {
        return $this->createQueryBuilder('service')
              ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
              'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
              'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

              ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
                )

                ->leftJoin(
                    CategoryEntity::class,
                    'category',
                    Join::WITH,
                    'category.id = service.categoryID'
                )

              ->getQuery()
              ->getResult();
    }
    
    public function getServicesOfUser($createdBy)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->andWhere('service.createdBy = :createdBy')
            ->setParameter('createdBy', $createdBy)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->getQuery()
            ->getArrayResult();
    }
    
    public function getServicesByQuery($query)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->andWhere('service.title LIKE :query')
            ->setParameter('query', '%'.$query.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->orderBy('service.id')

            ->getQuery()
            ->getArrayResult();
    }
   
    public function getServiceOfUserById($userID, $id)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->andWhere('service.id = :id')
            ->andWhere('service.createdBy = :userID')

            ->setParameter('id', $id)
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->getQuery()
            ->getResult();
    }

    public function getServicesByCategoryID($categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage', 'service.categoryID',
            'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByCity($city)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByPrice($price)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price = :price')
            ->setParameter('price', $price)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByCityAndPrice($city, $price)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->andWhere('service.price = :price')
            ->setParameter('price', $price)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByTwoPrices($price1, $price2)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price >= :price1')
            ->setParameter('price1', $price1)

            ->andWhere('service.price <= :price2')
            ->setParameter('price2', $price2)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByTwoPricesAndCity($price1, $price2, $city)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'category.arabicName as arabicName', 'category.turkishName as turkishName', 'service.image', 
            'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price >= :price1')
            ->setParameter('price1', $price1)

            ->andWhere('service.price <= :price2')
            ->setParameter('price2', $price2)

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByCityAndCategoryID($city, $categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByPriceAndCategoryID($price, $categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price = :price')
            ->setParameter('price', $price)

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByCityAndPriceAndCategoryID($city, $price, $categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->andWhere('service.price = :price')
            ->setParameter('price', $price)

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByTwoPricesAndCategoryID($price1, $price2, $categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price >= :price1')
            ->setParameter('price1', $price1)

            ->andWhere('service.price <= :price2')
            ->setParameter('price2', $price2)

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

    public function getServicesByTwoPricesAndCityAndCategoryID($price1, $price2, $city, $categoryID)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.categoryID', 'category.name as categoryName', 'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->leftJoin(
                CategoryEntity::class,
                'category',
                Join::WITH,
                'category.id = service.categoryID'
            )

            ->andWhere('service.price >= :price1')
            ->setParameter('price1', $price1)

            ->andWhere('service.price <= :price2')
            ->setParameter('price2', $price2)

            ->andWhere('service.city = :city')
            ->setParameter('city', $city)

            ->andWhere('service.categoryID = :categoryID')
            ->setParameter('categoryID', $categoryID)

            ->getQuery()
            ->getResult();
    }

}
