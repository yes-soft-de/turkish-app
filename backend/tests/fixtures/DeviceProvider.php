<?php

namespace App\Tests\fixtures;

use PHPUnit\Framework\TestCase;

class DeviceProvider extends TestCase
{

    public function create()
    { 
        return [
            'CreateDevice' => [1, 1], [1, 1],[12, 12], [13, 13]
        ];
    }

    public function getDevicesOfUser()
    {
        return [
            'getDevicesOfUser' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getDeviceById()
    {
        return [
            'getDeviceById' => [1, 1], [1, 1],[11, 11], [11, 11]
                ];
    }

    public function getAllDevices()
    {
        return [
            'getAllDevices' => [1, 1], [1, 1],[11, 11], [11, 11]
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


}
