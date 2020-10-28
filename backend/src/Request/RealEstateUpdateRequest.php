<?php


namespace App\Request;
use DateTime;

class RealEstateUpdateRequest
{
    private $id;

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

    public function __construct()
    {
        $this->createdAt = new DateTime('Now');
    }  

    /**
     * Get the value of id
     */ 
    public function getId()
    {
    return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
    $this->id = $id;

    return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(): self
    {
        $this->createdAt = new \DateTime('Now');

        return $this;
    }
}