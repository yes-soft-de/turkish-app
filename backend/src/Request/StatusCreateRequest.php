<?php


namespace App\Request;
use DateTime;

class StatusCreateRequest
{
    private $userID;
    private $LawyerID;
    private $status;
    private $createdBy;
    private $createdAt;

    public function __construct()
    {
        $this->createdAt = new DateTime('Now');
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