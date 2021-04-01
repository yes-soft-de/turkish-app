<?php


namespace App\Request;


class ServiceCreateRequest
{
    private $title;

    private $description;

    private $createdBy;

    private $image;

    private $type;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }
}