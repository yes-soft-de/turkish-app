<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class StatusProvider extends TestCase
{

    public function create()
    { 
        return [
            //'title' => [Expected..],[Actual..] 
            'CreateStatus' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

    public function update()
    {
        return [
            'UpdateStatus' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getAgreements()
    {
        return [
            'getAgreementsByUserId' => [112, 112], [1020, 1020],[120, 120]
                ];
    }

}
