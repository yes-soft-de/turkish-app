<?php


class MapperReaction
{
    /**
     * @var ObjectReaction $reaction
     */
    private $reaction;

    /**
     * @return ObjectReaction
     */
    public function getReaction(): ObjectReaction
    {
        return $this->reaction;
    }

    public function setReaction($type, $entity, $itemID): void
    {
        $this->reaction = new ObjectReaction();

        $this->reaction->setType($type);
        $this->reaction->setEntity($entity);
        $this->reaction->setItemID($itemID);
    }

    public function getReactionAsArray(): array
    {
        return [
            "type"=>$this->reaction->getType(),
            "entity"=>$this->reaction->getEntity(),
            "itemID"=>$this->reaction->getItemID()
        ];
    }
}