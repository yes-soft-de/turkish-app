<?php

namespace App\Repository;

use App\Entity\ReactionEntity;
use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method ReactionEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReactionEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReactionEntity[]    findAll()
 * @method ReactionEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReactionEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReactionEntity::class);
    }

    public function getAll($data ,$itemID)
    {
        return $this->createQueryBuilder('Reaction')
        ->addSelect('Reaction.type','Reaction.createdAt','Reaction.itemID',  
        'Reaction.entity', 'UserProfileEntity.userName', 'UserProfileEntity.image')
       
        ->leftJoin(
            UserProfileEntity::class,
            'UserProfileEntity',
            Join::WITH,
            'UserProfileEntity.userID =Reaction.createdBy'
        )

        ->andWhere('Reaction.itemID = :itemID')
        ->andWhere('Reaction.entity = :data')

        ->setParameter('itemID', $itemID)
        ->setParameter('data', $data)

        ->getQuery()
        ->getResult();
    }

    public function getReactionsForUser($userID)
    {
        return $this->createQueryBuilder('Reaction')
        ->addSelect('Reaction.type','Reaction.createdAt','Reaction.itemID',  'Reaction.entity', 'UserProfileEntity.userName', 'UserProfileEntity.image')

        ->andWhere('Reaction.createdBy = :userID')

        ->leftJoin(
            UserProfileEntity::class,
            'UserProfileEntity',
            Join::WITH,
            'UserProfileEntity.userID =:userID'
        )

        ->setParameter('userID', $userID)
        ->getQuery()
        ->getResult();
        
    }

    public function getReactionForUser($data, $itemID, $userID)
    {
        return $this->createQueryBuilder('Reaction')
        ->andWhere('Reaction.itemID = :itemID')
        ->andWhere('Reaction.entity = :data')
        ->andWhere('Reaction.createdBy = :createdBy')
        ->setParameter('itemID', $itemID)
        ->setParameter('data', $data)
        ->setParameter('createdBy', $userID)
        ->getQuery()
        ->getResult();
    }

    public function reactionAll($ID, $entity)
    {
        $s= $this->createQueryBuilder('Reaction')
        ->select('count(Reaction.type) as reactionCount','Reaction.createdBy')
        ->andWhere('Reaction.itemID = :ID')
        ->andWhere('Reaction.entity = :entity')
        ->setParameter('ID', $ID)
        ->setParameter('entity', $entity)
        ->getQuery()
        ->getResult();
        
    }

    public function reactionforItem($ID, $entity)
    {
        return $this->createQueryBuilder('Reaction')
        ->select('count(Reaction.type) as reactionCount','Reaction.createdBy')
        ->andWhere('Reaction.itemID = :ID')
        ->andWhere('Reaction.entity = :entity')
        ->setParameter('ID', $ID)
        ->setParameter('entity', $entity)
        ->getQuery()
        ->getResult();
    }

    public function getNotifications($userID)
    {
        return $this->createQueryBuilder('reaction')
            ->select('reaction.id', 'reaction.createdAt', 'reaction.entity', 'reaction.itemID', 'reaction.type',
             'reaction.createdBy', 'userProfileEntity.userName as username', 'userProfileEntity.image as userImage')

            ->andWhere('reaction.type = 1')

            ->andWhere('reaction.createdBy != :userID')
            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = reaction.createdBy'
            )

            ->orderBy('reaction.createdAt', 'DESC')
            ->setMaxResults(20)

            ->getQuery()
            ->getResult();
    }

   }
