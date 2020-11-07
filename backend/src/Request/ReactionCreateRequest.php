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

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }
}