<?php


namespace App\Request;

class ServicesUpdateRequest
{
    private $id;

    private $title;

    private $description;

    private $createdBy;

    private $image;

    private $type;

    public function getId()
    {
        return $this->id;
    }

    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function setImage($image)
    {
        $this->image = $image;
    }

    public function getType()
    {
        return $this->type;
    }

    public function setType($type)
    {
        $this->type = $type;
    }
}