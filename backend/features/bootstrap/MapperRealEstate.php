<?php


class MapperRealEstate
{
    /**
     * @var ObjectRealEstate $realEstate
     */
    private $realEstate;

    public function __construct()
    {
    }

    /**
     * @return ObjectRealEstate
     */
    public function getRealEstate(): ObjectRealEstate
    {
        return $this->realEstate;
    }

    public function setRealEstate($city, $space, $price, $description, $status, $state,
                                  $image, $numberOfFloors, $cladding, $homeFurnishing, $realEstateType): void
    {
        $this->realEstate = new ObjectRealEstate();

        $this->realEstate->setCity($city);
        $this->realEstate->setSpace($space);
        $this->realEstate->setPrice($price);
        $this->realEstate->setDescription($description);
        $this->realEstate->setStatus($status);
        $this->realEstate->setState($state);
        $this->realEstate->setImage($image);
        $this->realEstate->setNumberOfFloors($numberOfFloors);
        $this->realEstate->setCladding($cladding);
        $this->realEstate->setHomeFurnishing($homeFurnishing);
        $this->realEstate->setRealEstateType($realEstateType);
    }

    public function getRealEstateAsArray(): array
    {
        return [
            "city"=>$this->realEstate->getCity(),
            "space"=>$this->realEstate->getSpace(),
            "price"=>$this->realEstate->getPrice(),
            "description"=>$this->realEstate->getDescription(),
            "status"=>$this->realEstate->getStatus(),
            "state"=>$this->realEstate->getState(),
            "image"=>$this->realEstate->getImage(),
            "numberOfFloors"=>$this->realEstate->getNumberOfFloors(),
            "cladding"=>$this->realEstate->getCladding(),
            "homeFurnishing"=>$this->realEstate->getHomeFurnishing(),
            "realEstateType"=>$this->realEstate->getRealEstateType()
        ];
    }
}