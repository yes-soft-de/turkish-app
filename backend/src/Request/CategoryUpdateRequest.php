<?php

namespace App\Request;

class CategoryUpdateRequest
{
    private $id;

    private $name;

    private $description;

    private $arabicName;

    private $arabicDescription;

    private $turkishName;

    private $turkishDescription;

    private $lang;

    public function getId()
    {
        return $this->id;
    }

}
