<?php


namespace App\Request;
use DateTime;

class StatusCreateRequest
{
    private $createdBy;

    private $lawyerID;

    private $status;

    private $createdAt;

    private $entity;

    private $itemID;


    /**
     * Set the value of createdBy
     *
     * @return  self
     */ 
    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;

        return $this;
    }
}