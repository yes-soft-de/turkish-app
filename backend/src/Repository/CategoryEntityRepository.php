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

    public function getCategoriesInEnglish()
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.name', 'category.description')

            ->getQuery()
            ->getResult();
    }

    public function getCategoriesInArabic()
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.arabicName as name', 'category.arabicDescription as description')

            ->getQuery()
            ->getResult();
    }

    public function getCategoriesInTurkish()
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.turkishName as name', 'category.turkishDescription as description')

            ->getQuery()
            ->getResult();
    }

    public function getAll()
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.name', 'category.description', 'category.turkishName', 'category.turkishDescription',
            'category.arabicName', 'category.arabicDescription', 'category.lang')

            ->getQuery()
            ->getResult();
    }

    public function getCategoryById($id)
    {
        return $this->createQueryBuilder('category')
            ->select('category.id', 'category.name', 'category.description', 'category.turkishName', 'category.turkishDescription',
            'category.arabicName', 'category.arabicDescription', 'category.lang')

            ->andWhere('category.id = :id')
            ->setParameter('id', $id)

            ->getQuery()
            ->getResult();
    }

}