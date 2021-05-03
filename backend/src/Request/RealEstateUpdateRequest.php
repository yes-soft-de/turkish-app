<?php


namespace App\Request;
use DateTime;

class RealEstateUpdateRequest
{
    private $id;
    
    private $title;
    
    private $country;

    private $city;

    private $space;

    private $price;

    private $description;

    private $status;

    private $image;

    private $numberOfFloors;

    private $homeFurnishing;

    private $realEstateType;

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

    /**
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

}