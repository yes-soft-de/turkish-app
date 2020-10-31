<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class AdminProvider extends TestCase
{

    public function adminCreate()
    { 
        return [
            'adminCreate' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

}
