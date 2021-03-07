<?php

namespace App\Request;


class CommentCreateRequest
{
    private $createdBy;
    
    private $entity;

    private $itemID;

    private $comment;
    
    private $createdAt;

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }

}