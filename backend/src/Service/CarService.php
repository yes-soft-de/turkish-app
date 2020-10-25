<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Manager\CarManager;
use App\Request\CreateCarRequest;
use App\Request\GetByIdRequest;
use App\Response\CreateCarResponse;
use App\Response\GetCarByIdResponse;
use App\Response\GetCarResponse;
use App\Response\UpdateCarResponse;

class CarService
{
    private $autoMapping;
    private $carManager;

    public function __construct(AutoMapping $autoMapping, CarManager $carManager)
    {
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
    }

    public function create(CreateCarRequest $request)
    {
        $carResult = $this->carManager->create($request);

        return $this->autoMapping->map(CarEntity::class, CreateCarResponse::class, $carResult);
    }

    public function getCarById($request)
    {
        $result = $this->carManager->getCarById($request);

        return $this->autoMapping->map(CarEntity::class, GetCarByIdResponse::class, $result);
    }

    public function getCarsOfUser($request)
    {
        $response = [];
        $result = $this->carManager->getCarsOfUser($request);
        //dd($result);
        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map(CarEntity::class, GetCarResponse::class, $row);
        }
        //dd($response);
        return $response;
    }

    public function getAllCars()
    {
        $response = [];
        $result = $this->carManager->getAllCars();

        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map(CarEntity::class, GetCarResponse::class, $row);
        }

        return $response;
    }

    public function update($request)
    {
        $carResult = $this->carManager->update($request);

        return $this->autoMapping->map(CarEntity::class, UpdateCarResponse::class, $carResult);
    }

    public function delete($result)
    {
        $carResult = $this->carManager->delete($result);

        if($carResult == null)
        {
            return null;
        }
        return  $this->autoMapping->map(CarEntity::class, GetCarByIdResponse::class, $carResult);
    }
}