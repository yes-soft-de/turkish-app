<?php

namespace App\Repository;

use App\Entity\ImageEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ImageEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ImageEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ImageEntity[]    findAll()
 * @method ImageEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ImageEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ImageEntity::class);
    }

    public function getImages($id, $entity)
    {
        return $this->createQueryBuilder('images')
            ->select('images.image', 'images.specialLink')

            ->andWhere('images.itemID = :id')
            ->andWhere('images.entity = :entity')
            ->setParameter('id', $id)
            ->setParameter('entity', $entity)

            ->getQuery()
            ->getResult();
    }
}
