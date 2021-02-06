<?php

namespace App\Request;

class ReportCreateRequest
{
    private $userID;
    
    private $entity;
    
    private $itemID;

    private $reason;
      
    /**
    * @param mixed $userID
    */
    public function setUserId($userID): void
    {
        $this->userID = $userID;
    }

    /**
    * @return mixed
    */
    public function getUserId()
    {
        return $this->userID;
    }
}
