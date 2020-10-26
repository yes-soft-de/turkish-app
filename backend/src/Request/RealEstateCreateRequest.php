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

    public function __construct()
    {
        $this->createdAt = new DateTime('Now');
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