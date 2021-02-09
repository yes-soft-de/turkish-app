<?php

namespace App\Repository;

use App\Entity\ReportEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\UserProfileEntity;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method ReportEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReportEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReportEntity[]    findAll()
 * @method ReportEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReportEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReportEntity::class);
    }

    public function getAllReports()
    {
        return $this->createQueryBuilder('report')
            ->select('report.id', 'report.userID', 'report.entity', 'report.itemID', 'report.reason', 'userProfile.userName', 
             'userProfile.image')

             ->leftJoin(
                UserProfileEntity::class, 
                'userProfile', 
                Join::WITH, 
                'userProfile.userID = report.userID')
            
            ->getQuery()
            ->getResult();
    }

    public function getReportById($id)
    {
        return $this->createQueryBuilder('report')
            ->select('report.id', 'report.userID', 'report.entity', 'report.itemID', 'report.reason', 'userProfile.userName', 
             'userProfile.image')

            ->leftJoin(
                UserProfileEntity::class, 
                'userProfile', 
                Join::WITH, 
                'userProfile.userID = report.userID')

            ->andWhere('report.id =:id')
            ->setParameter('id', $id)
            
            ->getQuery()
            ->getResult();
    }
}
