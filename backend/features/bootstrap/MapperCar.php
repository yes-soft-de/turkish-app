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

    public function setCar($brand, $company, $engine, $price, $description, $status,
                           $distance, $carType, $gearType, $cc, $fuel, $location, $image): void
    {
        $this->car = new ObjectCar();

        $this->car->setBrand($brand);
        $this->car->setCompany($company);
        $this->car->setEngine($engine);
        $this->car->setPrice($price);
        $this->car->setDescription($description);
        $this->car->setStatus($status);
        $this->car->setDistance($distance);
        $this->car->setCarType($carType);
        $this->car->setGearType($gearType);
        $this->car->setCc($cc);
        $this->car->setFuel($fuel);
        $this->car->setLocation($location);
        $this->car->setImage($image);
    }

    public function getCarAsArray(): array
    {
        return [
            "brand"=>$this->car->getBrand(),
            "company"=>$this->car->getCompany(),
            "engine"=>$this->car->getEngine(),
            "price"=>$this->car->getPrice(),
            "description"=>$this->car->getDescription(),
            "status"=>$this->car->getStatus(),
            "distance"=>$this->car->getDistance(),
            "carType"=>$this->car->getCarType(),
            "gearType"=>$this->car->getGearType(),
            "cc"=>$this->car->getCc(),
            "fuel"=>$this->car->getFuel(),
            "location"=>$this->car->getLocation(),
            "image"=>$this->car->getImage()
        ];
    }
}