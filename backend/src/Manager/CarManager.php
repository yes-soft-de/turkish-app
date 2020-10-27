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

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, CarEntityRepository $carEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->carEntityRepository = $carEntityRepository;
    }

    public function create(CarCreateRequest $request)
    {
        $carEntity = $this->autoMapping->map(CarCreateRequest::class, CarEntity::class, $request);

        $this->entityManager->persist($carEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $carEntity;
    }

    public function getCarById(GetByIdRequest $request)
    {
        return $this->carEntityRepository->getCarById($request->getId());
    }

    public function getCarsOfUser($request)
    {
        return $this->carEntityRepository->getCarsOfUser($request->get('createdBy'));
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

            $this->entityManager->flush();

            return $carEntity;
        }
    }

    public function delete(DeleteRequest $request)
    {
        $carEntity = $this->carEntityRepository->getCarById($request->getId());
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
}