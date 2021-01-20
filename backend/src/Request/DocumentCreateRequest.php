<?php


namespace App\Request;


class DocumentCreateRequest
{
    private $image;

    private $entity;

    private $itemID;

    private $specialLink;

    /**
     * @return mixed
     */
    public function getSpecialLink()
    {
        return $this->specialLink;
    }

    /**
     * @param mixed $specialLink
     */
    public function setSpecialLink($specialLink): void
    {
        $this->specialLink = $specialLink;
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
    public function getItemID()
    {
        return $this->itemID;
    }

    /**
     * @param mixed $itemID
     */
    public function setItemID($itemID): void
    {
        $this->itemID = $itemID;
    }

    /**
     * @return mixed
     */
    public function getEntity()
    {
        return $this->entity;
    }

    /**
     * @param mixed $entity
     */
    public function setEntity($entity): void
    {
        $this->entity = $entity;
    }
}