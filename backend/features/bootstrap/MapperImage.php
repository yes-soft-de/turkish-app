<?php


class MapperImage
{
    /**
     * @var ObjectImage $image
     */
    private $image;

    public function __construct()
    {
    }

    /**
     * @return ObjectImage
     */
    public function getImage(): ObjectImage
    {
        return $this->image;
    }

    public function setImage($image, $entity, $itemID): void
    {
        $this->image = new ObjectImage();

        $this->image->setImage($image);
        $this->image->setEntity($entity);
        $this->image->setItemID($itemID);
    }

    public function getImageAsArray(): array
    {
        return [
            "image" => $this->image->getImage(),
            "entity" => $this->image->getEntity(),
            "itemID" => $this->image->getItemID()
        ];
    }
}