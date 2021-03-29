<?php


namespace App\Request;
use DateTime;

class RealEstateCreateRequest
{
    private $country;

    private $city;

    private $space;

    private $price;

    private $description;

    private $status;

    private $createdBy;

    private $createdAt;

    private $image;

    private $numberOfFloors;

    private $homeFurnishing;

    private $realEstateType;

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

}