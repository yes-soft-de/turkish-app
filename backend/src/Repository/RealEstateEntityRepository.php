<?php

namespace App\Repository;

use App\Entity\RealEstateEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\UserProfileEntity;

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
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType',
                'RealEstateEntity.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('RealEstateEntity.id = :id')

            ->setParameter('id', $id)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->getQuery()
            ->getResult();
    }

    public function getRealEstateByIdUnaccepted($id)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType', 'RealEstateEntity.rooms',
                'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')
         
            ->andWhere('RealEstateEntity.id = :id')
          
            ->setParameter('id', $id)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->getQuery()
            ->getResult();
    }

    public function getAllRealEstate()
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.id', 'RealEstateEntity.country', 'RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status', 'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink', 'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType', 'RealEstateEntity.rooms', 'UserProfileEntity.userName', 'UserProfileEntity.image as imageUser')

            ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = RealEstateEntity.createdBy'
            )
            
//            ->andWhere("RealEstateEntity.state = 'Accepted'")

            ->getQuery()
            ->getResult();
    }

    public function getAllRealEstateUnaccepted()
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.id', 'RealEstateEntity.country', 'RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status', 'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink', 'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType', 'RealEstateEntity.rooms', 'UserProfileEntity.userName', 'UserProfileEntity.image as imageUser')

            ->leftJoin(
                UserProfileEntity::class,
                'UserProfileEntity',
                Join::WITH,
                'UserProfileEntity.userID = RealEstateEntity.createdBy'
            )
            
            ->andWhere("RealEstateEntity.state = 'Unaccepted'")

            ->getQuery()
            ->getResult();
    }

    public function getRealEstateByUser($userID)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.id', 'RealEstateEntity.country', 'RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status', 'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink', 'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType', 'RealEstateEntity.rooms')

            ->andWhere('RealEstateEntity.createdBy = :userID')

            ->setParameter('userID', $userID)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterCity($value)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                    'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                    'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType',
                    'RealEstateEntity.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->andWhere('RealEstateEntity.city = :value')
            ->andWhere("RealEstateEntity.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                    'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                    'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType',
                    'RealEstateEntity.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->andWhere('RealEstateEntity.price = :value')
            ->andWhere("RealEstateEntity.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getRealEstatesByType($realEstateType)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType', 
                'RealEstateEntity.rooms', 'userProfileEntity.userName as userName', 'userProfileEntity.image as imageUser')

            ->andWhere('RealEstateEntity.realEstateType LIKE :realEstateType')

            ->setParameter('realEstateType', '%'.$realEstateType.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->orderBy('RealEstateEntity.id')

            ->getQuery()
            ->getResult()
            ;
    }

    public function getFilterByPriceAndCity($price, $location)
    {
        return $this->createQueryBuilder('realEstate')
            ->select('realEstate.country','realEstate.city', 'realEstate.space', 'realEstate.price', 'realEstate.description', 'realEstate.status',
                    'realEstate.createdBy', 'realEstate.createdAt', 'realEstate.updateAt', 'realEstate.state', 'realEstate.image', 'realEstate.specialLink',
                    'realEstate.numberOfFloors', 'realEstate.cladding', 'realEstate.homeFurnishing', 'realEstate.realEstateType',
                    'realEstate.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = realEstate.createdBy'
            )

            ->andWhere('realEstate.price = :price')
            ->andWhere('realEstate.city = :value')
            ->andWhere("realEstate.state = 'Accepted'")

            ->setParameter('price', $price)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPrices($price, $price_2)
    {
        return $this->createQueryBuilder('realEstate')
            ->select('realEstate.country','realEstate.city', 'realEstate.space', 'realEstate.price', 'realEstate.description', 'realEstate.status',
                    'realEstate.createdBy', 'realEstate.createdAt', 'realEstate.updateAt', 'realEstate.state', 'realEstate.image', 'realEstate.specialLink',
                    'realEstate.numberOfFloors', 'realEstate.cladding', 'realEstate.homeFurnishing', 'realEstate.realEstateType',
                    'realEstate.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = realEstate.createdBy'
            )

            ->andWhere('realEstate.price >= :price')
            ->andWhere('realEstate.price <= :price2')
            ->andWhere("realEstate.state = 'Accepted'")

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)

            ->getQuery()
            ->getArrayResult();
    }

    public function getFilterByTwoPricesAndCity($price, $price_2, $location)
    {
        return $this->createQueryBuilder('realEstate')
            ->select('realEstate.country','realEstate.city', 'realEstate.space', 'realEstate.price', 'realEstate.description', 'realEstate.status',
                    'realEstate.createdBy', 'realEstate.createdAt', 'realEstate.updateAt', 'realEstate.state', 'realEstate.image', 'realEstate.specialLink',
                    'realEstate.numberOfFloors', 'realEstate.cladding', 'RealEstateEntity.homeFurnishing', 'realEstate.realEstateType',
                    'realEstate.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = realEstate.createdBy'
            )

            ->andWhere('realEstate.price >= :price')
            ->andWhere('realEstate.price <= :price2')
            ->andWhere('realEstate.city = :value')
            ->andWhere("realEstate.state = 'Accepted'")

            ->setParameter('price', $price)
            ->setParameter('price2', $price_2)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }

    public function getSoldRealEstatesOfUser($userID)
    {
        return $this->createQueryBuilder('realEstateEntity')
            ->select('realEstateEntity.realEstateType as itemName', 'realEstateEntity.completeDate as date')

            ->andWhere("realEstateEntity.status = 'sold'")

            ->andWhere('realEstateEntity.createdBy =:userID')
            ->setParameter('userID', $userID)

            ->getQuery()
            ->getResult();
    }
   
    public function getRealEstateOfUserById($userID, $id)
    {
        return $this->createQueryBuilder('RealEstateEntity')
            ->select('RealEstateEntity.country','RealEstateEntity.city', 'RealEstateEntity.space', 'RealEstateEntity.price', 'RealEstateEntity.description', 'RealEstateEntity.status',
                'RealEstateEntity.createdBy', 'RealEstateEntity.createdAt', 'RealEstateEntity.updateAt', 'RealEstateEntity.state', 'RealEstateEntity.image', 'RealEstateEntity.specialLink',
                'RealEstateEntity.numberOfFloors', 'RealEstateEntity.cladding', 'RealEstateEntity.homeFurnishing', 'RealEstateEntity.realEstateType',
                'RealEstateEntity.rooms', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('RealEstateEntity.id = :id')
            ->andWhere('RealEstateEntity.createdBy = :userID')

            ->setParameter('id', $id)
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = RealEstateEntity.createdBy'
            )

            ->getQuery()
            ->getResult();
    }
}
