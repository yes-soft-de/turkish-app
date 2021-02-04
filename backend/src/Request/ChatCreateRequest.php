<?php


namespace App\Request;


class ChatCreateRequest
{
    private $itemID;

    private $entity;

    private $roomID;

    private $userOne;

    private $userTwo;

    public function getItemID()
    {
        return $this->itemID;
    }

    public function getEntity()
    {
        return $this->entity;
    }

    public function setRoomID($roomID)
    {
        $this->roomID = $roomID;
    }

    public function setUserOne($userOneID)
    {
        $this->userOne = $userOneID;
    }

    public function getUserOne()
    {
        return $this->userOne;
    }

    public function setUserTwo($userTwoID)
    {
        $this->userTwo = $userTwoID;
    }

    public function getUserTwo()
    {
        return $this->userTwo;
    }
}