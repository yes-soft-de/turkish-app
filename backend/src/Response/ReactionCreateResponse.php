<?php

namespace App\Response;

class ReactionCreateResponse
{
    public $id;

    public $createdBy;

    public $type;

    public $createdAt;
    
    public $itemID;
    
    public $entity;

    /**
     * @return mixed
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

}