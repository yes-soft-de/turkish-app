<?php


namespace App\Request;
use DateTime;

class StatusCreateRequest
{
    private $createdBy;
    private $LawyerID;
    private $status;
    private $createdAt;


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