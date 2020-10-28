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

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }
}