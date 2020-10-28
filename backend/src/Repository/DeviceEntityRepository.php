<?php

namespace App\Repository;

use App\Entity\DeviceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

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

    public function getDeviceById($id): ?DeviceEntity
    {
        return $this->createQueryBuilder('device')
            ->andWhere('device.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getDevicesOfUser($createdBy)
    {
        return $this->createQueryBuilder('device')
            ->andWhere('device.createdBy = :createdBy')
            ->setParameter('createdBy', $createdBy)
            ->getQuery()
            ->getArrayResult();
    }

    public function getAllDevices()
    {
        return $this->createQueryBuilder('device')
            ->getQuery()
            ->getArrayResult();
    }
}
