<?php


namespace App\Request;
use DateTime;

class CarUpdateRequest
{
    private $id;

    private $yearOfProduction;

    private $price;

    private $description;

    private $status;

    private $distance;

    private $carType;

    private $gearType;

    private $country;

    private $city;

    private $image;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param mixed $price
     */
    public function setPrice($price): void
    {
        $this->price = $price;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description): void
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param mixed $status
     */
    public function setStatus($status): void
    {
        $this->status = $status;
    }

    /**
     * @return mixed
     */
    public function getUpdateAt()
    {
        return $this->updateAt;
    }

    /**
     * @param mixed $updateAt
     */
    public function setUpdateAt($updateAt): void
    {
         $this->updateAt = new DateTime('Now')  ;
    }

    /**
     * @return mixed
     */
    public function getDistance()
    {
        return $this->distance;
    }

    /**
     * @param mixed $distance
     */
    public function setDistance($distance): void
    {
        $this->distance = $distance;
    }

    /**
     * @return mixed
     */
    public function getYearOfProduction()
    {
        return $this->yearOfProduction;
    }

    /**
     * @param mixed $yearOfProduction
     */
    public function setYearOfProduction($yearOfProduction): void
    {
        $this->yearOfProduction = $yearOfProduction;
    }

    /**
     * @return mixed
     */
    public function getCarType()
    {
        return $this->carType;
    }

    /**
     * @param mixed $carType
     */
    public function setCarType($carType): void
    {
        $this->carType = $carType;
    }

    /**
     * @return mixed
     */
    public function getGearType()
    {
        return $this->gearType;
    }

    /**
     * @param mixed $gearType
     */
    public function setGearType($gearType): void
    {
        $this->gearType = $gearType;
    }

     /**
     * @return mixed
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @param mixed $country
     */
    public function setCountry($country): void
    {
        $this->country = $country;
    }

    /**
     * @return mixed
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * @param mixed $city
     */
    public function setCity($city): void
    {
        $this->city = $city;
    }

}