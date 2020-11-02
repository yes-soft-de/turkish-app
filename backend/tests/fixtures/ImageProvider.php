<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class ImageProvider extends TestCase
{

    public function create()
    { 
        return [
            'CreateImage' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }   
    public function getImages()
    { 
        return [
            'getImages' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }   

}
