<?php

namespace App\Request;

use DateTime;

class ReactionCreateRequest
{
    private $createdBy;
    private $type;
    private $createdAt;
    private $itemID;
    
    private $entity;

    public function __construct()
    {
        $this->createdAt = new DateTime('Now');
    }
     /**
     * @return mixed
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @param mixed $userID
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }

    /**
     * @return mixed
     */ 
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type): void
    {
        $this->type = $type;
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