<?php


class ObjectRealEstate
{
    private $city;
    private $space;
    private $price;
    private $description;
    private $status;
    private $createdBy;
    private $state;
    private $image;
    private $numberOfFloors;
    private $cladding;
    private $homeFurnishing;
    private $realEstateType;

    public function __construct()
    {
    }

    /**
     * @return mixed
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * @param mixed $city
     */
    public function setCity($city): void
    {
        $this->city = $city;
    }

    /**
     * @return mixed
     */
    public function getSpace()
    {
        return $this->space;
    }

    /**
     * @param mixed $space
     */
    public function setSpace($space): void
    {
        $this->space = $space;
    }

    /**
     * @return mixed
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param mixed $price
     */
    public function setPrice($price): void
    {
        $this->price = $price;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description): void
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param mixed $status
     */
    public function setStatus($status): void
    {
        $this->status = $status;
    }

    /**
     * @return mixed
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * @param mixed $createdBy
     */
    public function setCreatedBy($createdBy): void
    {
        $this->createdBy = $createdBy;
    }

    /**
     * @return mixed
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * @param mixed $state
     */
    public function setState($state): void
    {
        $this->state = $state;
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param mixed $image
     */
    public function setImage($image): void
    {
        $this->image = $image;
    }

    /**
     * @return mixed
     */
    public function getNumberOfFloors()
    {
        return $this->numberOfFloors;
    }

    /**
     * @param mixed $numberOfFloors
     */
    public function setNumberOfFloors($numberOfFloors): void
    {
        $this->numberOfFloors = $numberOfFloors;
    }

    /**
     * @return mixed
     */
    public function getCladding()
    {
        return $this->cladding;
    }

    /**
     * @param mixed $cladding
     */
    public function setCladding($cladding): void
    {
        $this->cladding = $cladding;
    }

    /**
     * @return mixed
     */
    public function getHomeFurnishing()
    {
        return $this->homeFurnishing;
    }

    /**
     * @param mixed $homeFurnishing
     */
    public function setHomeFurnishing($homeFurnishing): void
    {
        $this->homeFurnishing = $homeFurnishing;
    }

    /**
     * @return mixed
     */
    public function getRealEstateType()
    {
        return $this->realEstateType;
    }

    /**
     * @param mixed $realEstateType
     */
    public function setRealEstateType($realEstateType): void
    {
        $this->realEstateType = $realEstateType;
    }

}