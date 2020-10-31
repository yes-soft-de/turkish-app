<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class CarProvider extends TestCase
{

    public function create()
    { 
        return [
            'CreateCar' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

    public function getCarById()
    {
        return [
            'getCarById' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getCarsOfUser()
    {
        return [
            'getCarsOfUser' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getAllCars()
    {
        return [
            'getAllCars' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function update()
    {
        return [
            'update' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function delete()
    {
        return [
            'delete' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getFilter()
    {
        return [
            'getFilter' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    

}
