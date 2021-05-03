<?php

namespace App\Request;

class CategoryUpdateRequest
{
    private $id;

    private $name;

    private $description;

    private $lang;

    public function getId()
    {
        return $this->id;
    }

}
