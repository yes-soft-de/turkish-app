<?php


namespace App\Request;

class StatusUpdateRequest
{
    public $id;
    public $userID;
    public $LawyerID;
    public $status;
    public $createdBy;

    /**
    * @return mixed
    */
    public function getId()
    {
        return $this->id;
    }

    /**
    * @param mixed $id
    */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
    /**
     * @return mixed
     */
    public function getUserID()
    {
        return $this->userID;
    }

    /**
     * @param mixed $userID
     */
    public function setUserID($userID): void
    {
        $this->userID = $userID;
    }

    /**
     * @return mixed
     */ 
    public function getLawyerID()
    {
        return $this->LawyerID;
    }

    /**
     * @param mixed $LawyerID
     */
    public function setLawyerID($LawyerID): void
    {
        $this->LawyerID = $LawyerID;
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

     /**
     * @return mixed
     */  
    public function getCreatedBy()
    {
        return $this->createdBy;
    }


}