<?php


namespace App\Request;


class GetByIdRequest
{
<<<<<<< HEAD
public $id;
=======
    private $id;
>>>>>>> 9ee4a3e03d164ef6c33b2bae96f4e7ce0b445c80

    /**
     * GetByIdRequest constructor.
     * @param $id
     */
    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
<<<<<<< HEAD
     * @return integer
     */
    public function getId():int
=======
     * @return mixed
     */
    public function getId()
>>>>>>> 9ee4a3e03d164ef6c33b2bae96f4e7ce0b445c80
    {
        return $this->id;
    }

    /**
<<<<<<< HEAD
     * @param integer $id
=======
     * @param mixed $id
>>>>>>> 9ee4a3e03d164ef6c33b2bae96f4e7ce0b445c80
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

}