<?php


class MapperCar
{
    /**
     * @var ObjectCar $car
     */
    private $car;

    public function __construct()
    {
    }

    /**
     * @return ObjectCar
     */
    public function getCar(): ObjectCar
    {
        return $this->car;
    }

    public function setCar($model, $company, $engine, $price, $description, $status,
                           $createdBy, $distance): void
    {
        $this->car = new ObjectCar();

        $this->car->setModel($model);
        $this->car->setCompany($company);
        //$this->car->setProductionYear();
        $this->car->setEngine($engine);
        $this->car->setPrice($price);
        $this->car->setDescription($description);
        $this->car->setStatus($status);
        $this->car->setCreatedBy($createdBy);
        $this->car->setDistance($distance);
    }

    public function getCarAsArray(): array
    {
        return [
            "model"=>$this->car->getModel(),
            "company"=>$this->car->getCompany(),
            "engine"=>$this->car->getEngine(),
            "price"=>$this->car->getPrice(),
            "description"=>$this->car->getDescription(),
            "status"=>$this->car->getStatus(),
            "createdBy"=>$this->car->getCreatedBy(),
            "distance"=>$this->car->getDistance(),
        ];
    }
}