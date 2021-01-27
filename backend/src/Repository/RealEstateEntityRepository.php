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

            ->andWhere('RealEstateEntity.city = :value')
            ->andWhere("RealEstateEntity.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }
    public function getFilterPrice($value)
    {
        return $this->createQueryBuilder('RealEstateEntity')

            ->andWhere('RealEstateEntity.price <= :value')
            ->andWhere("RealEstateEntity.state = 'Accepted'")

            ->setParameter('value', $value)

            ->getQuery()
            ->getArrayResult();
    }

    public function getRealEstatesByType($realEstateType)
    {
        return $this->createQueryBuilder('realEstate')
            ->select('realEstate.id', 'realEstate.realEstateType')
            ->andWhere('realEstate.realEstateType LIKE :realEstateType')
            ->setParameter('realEstateType', '%'.$realEstateType.'%')
            ->orderBy('realEstate.id')
            ->getQuery()
            ->getResult()
            ;
    }

    public function getFilterByPriceAndCity($price, $location)
    {
        return $this->createQueryBuilder('realEstate')

            ->andWhere('realEstate.price <= :price')
            ->andWhere('realEstate.city = :value')
            ->andWhere("realEstate.state = 'Accepted'")

            ->setParameter('price', $price)
            ->setParameter('value', $location)

            ->getQuery()
            ->getArrayResult();
    }
   
}
