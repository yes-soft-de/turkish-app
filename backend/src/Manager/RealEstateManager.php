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

        }
        else {
            $Entity = $this->autoMapping->mapToObject(RealEstateUpdateRequest::class, RealEstateEntity::class, $request, $Entity);

            if($request->getStatus() == "sold")
            {
                $Entity->setCompleteDate(new \DateTime('Now'));
            }

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

    public function getFilter($price, $price_2, $location)
    {
        if ($location != null && $price == null && $price_2 == null)
        {
            return $this->repository->getFilterCity($location);
        }

        elseif ($price != null && $location == null && $price_2 == null)
        {
            return $this->repository->getFilterPrice($price);
        }

        elseif ($price != null && $location != null && $price_2 == null)
        {
            return $this->repository->getFilterByPriceAndCity($price, $location);
        }

        elseif ($price != null && $price_2 != null && $location == null)
        {
            return $this->repository->getFilterByTwoPrices($price, $price_2);
        }

        elseif ($price != null && $price_2 != null && $location != null)
        {
            return $this->repository->getFilterByTwoPricesAndCity($price, $price_2, $location);
        }

        elseif ($price == null && $location == null && $price_2 != null)
        {
            return $this->repository->getFilterPrice($price_2);
        }

        elseif ($price == null && $location != null && $price_2 != null)
        {
            return $this->repository->getFilterByPriceAndCity($price_2, $location);
        }
        
    }

    public function getRealEstatesByType($type)
    {
        return $this->repository->getRealEstatesByType($type);
    }

    public function getSoldRealEstatesOfUser($userID)
    {
        $realEstates = $this->repository->getSoldRealEstatesOfUser($userID);

        if($realEstates != null)
        {
            $realEstates[0]['state'] = "Sell";
        }

        return $realEstates;
    }
    
    public function getRealEstateOfUserById($userID, $id)
    {
        return $this->repository->getRealEstateOfUserById($userID, $id);
    }
    
}
