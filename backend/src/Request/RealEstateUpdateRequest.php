<?php


namespace App\Request;
use DateTime;

class RealEstateUpdateRequest
{
    private $id;
    
    private $country;

    private $city;

    private $space;

    private $price;

    private $description;

    private $status;

    private $createdBy;

    private $updateAt;

    private $state;

    private $image;

    private $numberOfFloors;

    private $cladding;

    private $homeFurnishing;

    private $realEstateType;
    
    private $rooms;

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
}