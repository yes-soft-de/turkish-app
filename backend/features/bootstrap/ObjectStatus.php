<?php


class ObjectStatus
{
    private $lawyerID;
    private $status;

    public function __construct()
    {
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