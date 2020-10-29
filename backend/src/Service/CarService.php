<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Manager\CarManager;
use App\Request\CarCreateRequest;
use App\Request\GetByIdRequest;
use App\Response\CarCreateResponse;
use App\Response\CarGetByIdResponse;
use App\Response\CarGetResponse;
use App\Response\CarUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CarService
{
    private $autoMapping;
    private $carManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, CarManager $carManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(CarCreateRequest $request)
    {
        $carResult = $this->carManager->create($request);

        return $this->autoMapping->map(CarEntity::class, CarCreateResponse::class, $carResult);
    }

    public function getCarById($request)
    {
        $result = $this->carManager->getCarById($request);

        return $this->autoMapping->map(CarEntity::class, CarGetByIdResponse::class, $result);
    }

    public function getCarsOfUser($userID)
    {
        $response = [];
        $result = $this->carManager->getCarsOfUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function getAllCars()
    {
        $response = [];
        $result = $this->carManager->getAllCars();

        foreach ($result as $row)
        {
            $row['image'] = $this->specialLinkCheck($row['specialLink']).$row['image'];

            $response[] = $this->autoMapping->map('array', CarGetResponse::class, $row);
        }

        return $response;
    }

    public function update($request)
    {
        $carResult = $this->carManager->update($request);

        return $this->autoMapping->map(CarEntity::class, CarUpdateResponse::class, $carResult);
    }

    public function delete($result)
    {
        $carResult = $this->carManager->delete($result);

        if($carResult == null)
        {
            return null;
        }
        return  $this->autoMapping->map(CarEntity::class, CarGetByIdResponse::class, $carResult);
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }
}