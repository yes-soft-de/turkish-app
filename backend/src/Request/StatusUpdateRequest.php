<?php


namespace App\Request;

class StatusUpdateRequest
{
    public $id;
    public $createdBy;
    public $lawyerID;
    public $status;

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
    public function getLawyerID()
    {
        return $this->lawyerID;
    }

    /**
     * @param mixed $lawyerID
     */
    public function setLawyerID($lawyerID): void
    {
        $this->lawyerID = $lawyerID;
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

}