<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class RealEstateProvider extends TestCase
{

    public function create()
    { 
        return [
            //'title' => [Expected..],[Actual..] 
            'CreateRealEstate' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

    public function update()
    {
        return [
            'UpdateRealEstate' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getRealEstateById()
    {
        return [
            'getRealEstateById' => [112, 112], [1020, 1020],[120, 120]
                ];
    }

    public function getAllRealEstate()
    {
        return [
            'getAllRealEstate' => [112, 112],[1120, 1120]
                ];
    }

    public function getRealEstateByUser()
    {
        return [
            'getRealEstateByUser' => [112, 112],[10012, 10012]
                ];
    }

    public function delete()
    {
        return [
            'delete' => [112, 112],[10012, 10012]
                ];
    }
    public function getFilter()
    {
        return [
            'getFilter' => [112, 112],[10012, 10012]
                ];
    }

}
