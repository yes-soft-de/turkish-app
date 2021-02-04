<?php

namespace App\Repository;

use App\Entity\MessageEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\UserProfileEntity;

/**
 * @method MessageEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method MessageEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method MessageEntity[]    findAll()
 * @method MessageEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MessageEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MessageEntity::class);
    }

    public function getSendMessagesList($userID)
    {
        return $this->createQueryBuilder('message')
            ->select('message.userOne', 'message.userTwo', 'message.roomID', 'message.createdAt as startAt', 
            'userProfileEntity.userName as username', 'userProfileEntity.image')

            ->andWhere('message.userOne = :userID')
            // ->andWhere('message.userTwo != :userID')

            ->setParameter('userID', $userID)

            ->leftJoin(
                UserProfileEntity::class,
                'userProfileEntity',
                Join::WITH,
                'userProfileEntity.userID = message.userTwo'
            )

            ->getQuery()
            ->getResult();
    }

    public function getChatByUsers($userOne, $userTwo)
    {
        return $this->createQueryBuilder('message')

            ->andWhere('message.userOne = :userOne')
            ->andWhere('message.userTwo = :userTwo')

            ->setParameter('userOne', $userOne)
            ->setParameter('userTwo', $userTwo)

            ->getQuery()
            ->getOneOrNullResult();
    }

    // public function getReceivedMessagesList($userID)
    // {
    //     return $this->createQueryBuilder('message')
    //         ->select('message.userOne', 'message.userTwo', 'message.roomID', 'message.createdAt as startAt', 
    //         'userProfileEntity.userName as username', 'userProfileEntity.image')

    //         ->andWhere('message.userTwo = :userID')

    //         ->setParameter('userID', $userID)

    //         ->leftJoin(
    //             UserProfileEntity::class,
    //             'userProfileEntity',
    //             Join::WITH,
    //             'userProfileEntity.userID = message.userOne'
    //         )

    //         ->getQuery()
    //         ->getResult();
    // }
}
