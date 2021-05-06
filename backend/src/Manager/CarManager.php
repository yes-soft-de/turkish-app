<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Repository\CarEntityRepository;
use App\Request\CarCreateRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Request\CarUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class CarManager
{
    private $autoMapping;
    private $entityManager;
    private $carEntityRepository;
    private $commentManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, CarEntityRepository $carEntityRepository,
     CommentManager $commentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->carEntityRepository = $carEntityRepository;
        $this->commentManager = $commentManager;
    }

    public function create(CarCreateRequest $request)
    {
        $carEntity = $this->autoMapping->map(CarCreateRequest::class, CarEntity::class, $request);
        $carEntity->setProductionYear($carEntity->getProductionYear());
        $this->entityManager->persist($carEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $carEntity;
    }

    public function getCarById($id)
    {
        return $this->carEntityRepository->getCarById($id);
    }

    public function getCarsOfUser($userID)
    {
        return $this->carEntityRepository->getCarsOfUser($userID);
    }

    public function getAllCars()
    {
        return $this->carEntityRepository->getAllCars();
    }

    public function update(CarUpdateRequest $request)
    {
        $carEntity = $this->carEntityRepository->find($request->getId());
        
        if(!$carEntity)
        {
            return null;
        }
        else
        {
            $carEntity = $this->autoMapping->mapToObject(CarUpdateRequest::class,
                CarEntity::class, $request, $carEntity);

            if($request->getStatus() == "sold" && $carEntity->getCompleteDate() == null)
            {
                $carEntity->setCompleteDate(new \DateTime('Now'));
            }

            $carEntity->setProductionYear($carEntity->getProductionYear());

            $this->entityManager->flush();

            return $carEntity;
        }
    }

    public function delete(DeleteRequest $request)
    {
        $carEntity = $this->carEntityRepository->find($request->getId());
        if(!$carEntity )
        {

        }
        else
        {
            $this->entityManager->remove($carEntity);
            $this->entityManager->flush();
        }
        return $carEntity;
    }

    public function getFilter($price, $price_2, $location)
    {
        if ($location != null && $price == null && $price_2 == null)
        {
            return $this->carEntityRepository->getFilterCity($location);
        }

        elseif ($price != null && $location == null && $price_2 == null)
        {
            return $this->carEntityRepository->getFilterPrice($price);
        }

        elseif ($price != null && $location != null && $price_2 == null)
        {
            return $this->carEntityRepository->getFilterByPriceAndCity($price, $location);
        }

        elseif ($price != null && $price_2 != null && $location == null)
        {
            return $this->carEntityRepository->getFilterByTwoPrices($price, $price_2);
        }

        elseif ($price != null && $price_2 != null && $location != null)
        {
            return $this->carEntityRepository->getFilterByTwoPricesAndCity($price, $price_2, $location);
        }

        elseif ($price == null && $location == null && $price_2 != null)
        {
            return $this->carEntityRepository->getFilterPrice($price_2);
        }

        elseif ($price == null && $location != null && $price_2 != null)
        {
            return $this->carEntityRepository->getFilterByPriceAndCity($price_2, $location);
        }

        elseif ($price == null && $location == null && $price_2 == null)
        {
            return $this->carEntityRepository->getAllCars();
        }
    }

    public function getCarsByType($brand)
    {
        return $this->carEntityRepository->getCarsByType($brand);
    }

    public function getSoldCarsOfUser($userID)
    {
        $cars =  $this->carEntityRepository->getSoldCarsOfUser($userID);

        if($cars != null)
        {
            $cars[0]['state'] = "Sell";
        }

        return $cars;
    }

    public function getCarOfUserById($userID, $id)
    {
        return $this->carEntityRepository->getCarOfUserById($userID, $id);
    }

    public function getCarCommentsNumber($id)
    {
        return $this->commentManager->getCommentsNumber("car", $id);
    }
    
}