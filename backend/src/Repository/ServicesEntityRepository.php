<?php

namespace App\Repository;

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
             'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
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
              'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

              ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
                )

              ->getQuery()
              ->getResult();
    }
    
    public function getServicesOfUser($createdBy)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->andWhere('service.createdBy = :createdBy')
            ->setParameter('createdBy', $createdBy)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->getQuery()
            ->getArrayResult();
    }
    
    public function getServicesByQuery($query)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.image', 'userProfile.userName', 'userProfile.image as userImage')

            ->andWhere('service.title LIKE :query')
            ->setParameter('query', '%'.$query.'%')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->orderBy('service.id')

            ->getQuery()
            ->getArrayResult();
    }
   
    public function getServiceOfUserById($userID, $id)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
            'service.image', 'userProfile.userName', 'userProfile.image as userImage')

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

            ->getQuery()
            ->getResult();
    }

    public function getServicesByType($type)
    {
        return $this->createQueryBuilder('service')
            ->select('service.id', 'service.title', 'service.createdBy', 'service.createdAt', 'service.updatedAt', 'service.description', 'service.type',
             'service.image', 'service.city', 'service.country', 'service.price', 'userProfile.userName', 'userProfile.image as userImage')

            ->leftJoin(
                UserProfileEntity::class,
                'userProfile',
                Join::WITH,
                'userProfile.userID = service.createdBy'
            )

            ->andWhere('service.type = :type')
            ->setParameter('type', $type)

            ->getQuery()
            ->getResult();
    }

}
