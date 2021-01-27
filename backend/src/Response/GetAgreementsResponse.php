<?php


namespace App\Response;


class GetAgreementsResponse
{ 
    public $createdBy;

    public $lawyerID;

    public $status;

    public $createdAt;

    public $entity;

    public $itemID;

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
    public function getItemID()
    {
        return $this->itemID;
    }

}