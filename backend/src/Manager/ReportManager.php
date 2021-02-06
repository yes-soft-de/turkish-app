<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReportEntity;
use App\Repository\ReportEntityRepository;
use App\Request\ReportCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReportManager
{
    private $autoMapping;
    private $entityManager;
    private $repository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ReportEntityRepository $repository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
    }

    public function create(ReportCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ReportCreateRequest::class, ReportEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getReports()
    {
        return $this->repository->getAllReports();
    }
}
