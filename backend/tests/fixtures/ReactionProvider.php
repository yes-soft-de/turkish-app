<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class ReactionProvider extends TestCase
{

    public function create()
    { 
        return [
            //'title' => [Expected..],[Actual..] 
            'CreateRealEstate' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

    public function getAll()
    {
        return [
            'getAll' => [1, 1]
                ];
    }

    public function getRealEstateById()
    {
        return [
            'getRealEstateById' => [112, 112], [1020, 1020],[120, 120]
                ];
    }

    public function getReactionsForUser()
    {
        return [
            'getReactionsForUser' => [112, 112], [1020, 1020],[120, 120]
                ];
    }

}
