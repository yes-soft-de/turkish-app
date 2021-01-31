<?php


namespace App\Request;
use DateTime;

class DeviceUpdateRequest
{
    private $id;

    private $type;
    
    private $brand;

    private $cpu;

    private $ram;

    private $battery;

    private $price;

    private $yearOfRelease;

    private $description;

    private $status;

    // private $createdBy;

    private $updateAt;

    private $gauge;

    private $country;

    private $city;

    private $durationOfUse;

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
    public function getCpu()
    {
        return $this->cpu;
    }

    /**
     * @param mixed $cpu
     */
    public function setCpu($cpu): void
    {
        $this->cpu = $cpu;
    }

    /**
     * @return mixed
     */
    public function getRam()
    {
        return $this->ram;
    }

    /**
     * @param mixed $ram
     */
    public function setRam($ram): void
    {
        $this->ram = $ram;
    }

    /**
     * @return mixed
     */
    public function getBattery()
    {
        return $this->battery;
    }

    /**
     * @param mixed $battery
     */
    public function setBattery($battery): void
    {
        $this->battery = $battery;
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
    public function getGauge()
    {
        return $this->gauge;
    }

    /**
     * @param mixed $gauge
     */
    public function setGauge($gauge): void
    {
        $this->gauge = $gauge;
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

    /**
     * @return mixed
     */
    public function getDurationOfUse()
    {
        return $this->durationOfUse;
    }

    /**
     * @param mixed $durationOfUse
     */
    public function setDurationOfUse($durationOfUse): void
    {
        $this->durationOfUse = $durationOfUse;
    }

}