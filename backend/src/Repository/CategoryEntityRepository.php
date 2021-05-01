<?php

namespace App\Repository;

use App\Entity\CategoryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method CategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method CategoryEntity[]    findAll()
 * @method CategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CategoryEntity::class);
    }

    public function getAll()
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.name', 'category.description')

            ->getQuery()
            ->getResult();
    }

    public function getCategoryById($id)
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.name', 'category.description')

            ->andWhere('category.id = :id')
            ->setParameter('id', $id)

            ->getQuery()
            ->getResult();
    }

}
