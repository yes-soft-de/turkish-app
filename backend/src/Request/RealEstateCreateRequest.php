<?php


namespace App\Request;
use DateTime;

class RealEstateCreateRequest
{
    private $city;

    private $space;

    private $price;

    private $description;

    private $status;

    private $createdBy;

    private $createdAt;

    private $state;

    private $image;

    private $numberOfFloors;

    private $cladding;

    private $homeFurnishing;

    private $realEstateType;

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }
}