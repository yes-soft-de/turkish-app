<?php


namespace App\Request;


class FilterRequest
{
    private $entity;

    private $price;

    private $city;

    /**
     * @return mixed
     */
    public function getEntity()
    {
        return $this->entity;
    }

    /**
     * @return mixed
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @return mixed
     */
    public function getCity()
    {
        return $this->city;
    }

}