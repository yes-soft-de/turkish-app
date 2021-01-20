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

    private $state;

    private $image;

    private $numberOfFloors;

    private $cladding;

    private $homeFurnishing;

    private $realEstateType;

    private $rooms;

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

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): self
    {
        $this->state = $state;

        return $this;
    }
}