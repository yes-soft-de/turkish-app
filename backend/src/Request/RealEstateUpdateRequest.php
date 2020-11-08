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

//    /**
//     * @return mixed
//     */
//    public function getCreatedAt()
//    {
//        return $this->createdAt;
//    }
//
//    /**
//     * @param mixed $createdAt
//     */
//    public function setCreatedAt($createdAt): void
//    {
//         $this->createdAt = new DateTime('Now')  ;
//    }
}