<?php


class ObjectStatus
{
    private $userID;
    private $LawyerID;
    private $status;

    public function __construct()
    {
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
}