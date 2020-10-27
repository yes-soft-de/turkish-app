<?php


namespace App\Response;


class GetAgreementsResponse
{ 
    public $id;
    public $userID;
    public $LawyerID;
    public $status;
    public $createdBy;
    public $createdAt;

    /**
     * Get the value of userID
     */ 
    public function getUserID()
    {
        return $this->userID;
    }

    /**
     * Set the value of userID
     *
     * @return  self
     */ 
    public function setUserID($userID)
    {
        $this->userID = $userID;

        return $this;
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
}