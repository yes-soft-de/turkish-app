<?php


namespace App\Request;


class ServiceCreateRequest
{
    private $title;

    private $description;

    private $createdBy;

    private $image;

    private $type;

    private $city;

    private $country;

    private $price;

    public function setCreatedBy($createdBy)
    {
        $this->createdBy = $createdBy;
    }
}