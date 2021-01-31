<?php


namespace App\Request;
use DateTime;

class CarUpdateRequest
{
    private $id;

    private $brand;

    private $company;

    private $yearOfRelease;

    private $engine;

    private $price;

    private $description;

    private $status;

    // private $createdBy;

    private $updateAt;

    private $distance;

    private $carType;

    private $gearType;

    private $cc;

    private $fuel;

    private $country;

    private $city;

    private $image;

    private $state;

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
    public function getCompany()
    {
        return $this->company;
    }

    /**
     * @param mixed $company
     */
    public function setCompany($company): void
    {
        $this->company = $company;
    }

    /**
     * @return mixed
     */
    public function getEngine()
    {
        return $this->engine;
    }

    /**
     * @param mixed $engine
     */
    public function setEngine($engine): void
    {
        $this->engine = $engine;
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

    // /**
    //  * @return mixed
    //  */
    // public function getCreatedBy()
    // {
    //     return $this->createdBy;
    // }

    // /**
    //  * @param mixed $createdBy
    //  */
    // public function setCreatedBy($createdBy): void
    // {
    //     $this->createdBy = $createdBy;
    // }

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
    public function getBrand()
    {
        return $this->brand;
    }

    /**
     * @param mixed $brand
     */
    public function setBrand($brand): void
    {
        $this->brand = $brand;
    }

    /**
     * @return mixed
     */
    public function getYearOfRelease()
    {
        return $this->yearOfRelease;
    }

    /**
     * @param mixed $yearOfRelease
     */
    public function setYearOfRelease($yearOfRelease): void
    {
        $this->yearOfRelease = $yearOfRelease;
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
    public function getCc()
    {
        return $this->cc;
    }

    /**
     * @param mixed $cc
     */
    public function setCc($cc): void
    {
        $this->cc = $cc;
    }

    /**
     * @return mixed
     */
    public function getFuel()
    {
        return $this->fuel;
    }

    /**
     * @param mixed $fuel
     */
    public function setFuel($fuel): void
    {
        $this->fuel = $fuel;
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