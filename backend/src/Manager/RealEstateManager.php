<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\RealEstateEntity;
use App\Repository\RealEstateEntityRepository;
use App\Request\GetByIdRequest;
use App\Request\RealEstateCreateRequest;
use App\Request\RealEstateUpdateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class RealEstateManager
{
    private $autoMapping;
    private $entityManager;
    private $repository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, RealEstateEntityRepository $repository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
    }

    public function RealEstateCreate(RealEstateCreateRequest $request)
    {
        $entity = $this->autoMapping->map(RealEstateCreateRequest::class, RealEstateEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getRealEstateById($id)
    {
        return $result = $this->repository->getRealEstateById($id);
    }

    public function getRealEstateByIdUnaccepted($id)
    {
        return $result = $this->repository->getRealEstateByIdUnaccepted($id);
    }

    public function getAllRealEstate()
    {
        return $result = $this->repository->getAllRealEstate();
    }

    public function getAllRealEstateUnaccepted()
    {
        return $result = $this->repository->getAllRealEstateUnaccepted();
    }

    public function getRealEstateByUser($userID)
    {
        return $result = $this->repository->getRealEstateByUser($userID);
    }

    public function realEstateUpdate(RealEstateUpdateRequest $request)
    {
        $Entity = $this->repository->find($request->getId());
        $request->setUpdateAt($request->getUpdateAt());
        if (!$Entity) {

        } else {
            $Entity = $this->autoMapping->mapToObject(RealEstateUpdateRequest::class, RealEstateEntity::class, $request, $Entity);
            $this->entityManager->flush();
        }
        return $Entity;
    }

    public function delete(DeleteRequest $request)
    {
        $item = $this->repository->find($request->getId());

        if(!$item )
        {

        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }
    
    public function getFilter($value, $key)
    {
        if ($key == 'city')
        {
            return $this->repository->getFilterCity($value);
        }
        
        if ($key == 'price')
        {
            return $this->repository->getFilterPrice($value);
        }
    }
    
}
