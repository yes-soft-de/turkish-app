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
    private $commentManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, RealEstateEntityRepository $repository,
     CommentManager $commentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
        $this->commentManager = $commentManager;
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

    public function getAllRealEstate()
    {
        return $result = $this->repository->getAllRealEstate();
    }

    public function getRealEstateByUser($userID)
    {
        return $result = $this->repository->getRealEstateByUser($userID);
    }

    public function realEstateUpdate(RealEstateUpdateRequest $request)
    {
        $Entity = $this->repository->find($request->getId());
        
        if (!$Entity) 
        {

        }
        else 
        {
            $Entity = $this->autoMapping->mapToObject(RealEstateUpdateRequest::class, RealEstateEntity::class, $request, $Entity);

            if($request->getStatus() == "sold" && $Entity->getCompleteDate() == null)
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

    public function getFilter($price, $price_2, $city)
    {
        if ($city != null && $price == null && $price_2 == null)
        {
            return $this->repository->getFilterCity($city);
        }

        elseif ($price != null && $city == null && $price_2 == null)
        {
            return $this->repository->getFilterPrice($price);
        }

        elseif ($price != null && $city != null && $price_2 == null)
        {
            return $this->repository->getFilterByPriceAndCity($price, $city);
        }

        elseif ($price != null && $price_2 != null && $city == null)
        {
            return $this->repository->getFilterByTwoPrices($price, $price_2);
        }

        elseif ($price != null && $price_2 != null && $city != null)
        {
            return $this->repository->getFilterByTwoPricesAndCity($price, $price_2, $city);
        }

        elseif ($price == null && $city == null && $price_2 != null)
        {
            return $this->repository->getFilterPrice($price_2);
        }

        elseif ($price == null && $city != null && $price_2 != null)
        {
            return $this->repository->getFilterByPriceAndCity($price_2, $city);
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

    public function getRealEstateCommentsNumber($id)
    {
        return $this->commentManager->getCommentsNumber("realEstate", $id);
    }
    
}
