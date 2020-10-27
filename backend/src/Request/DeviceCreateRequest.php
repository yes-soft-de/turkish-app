<?php


namespace App\Request;


class DeviceCreateRequest
{
    private $brand;

    private $cpu;

    private $ram;

    private $battery;

    private $price;

    private $yearOfRelease;

    private $description;

    private $status;

    private $createdBy;

    private $createdAt;

    private $gauge;

    private $location;

    private $durationOfUse;

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
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @param mixed $createdAt
     */
    public function setCreatedAt($createdAt): void
    {
        $this->createdAt = $createdAt;
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
    public function getLocation()
    {
        return $this->location;
    }

    /**
     * @param mixed $location
     */
    public function setLocation($location): void
    {
        $this->location = $location;
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