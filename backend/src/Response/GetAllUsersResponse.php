<?php


namespace App\Response;


class GetAllUsersResponse
{
    public $userID;

    public $email;

    public $roles = [];

    public $createDate;

    public function getUserID()
    {
        return $this->userID;
    }
}