<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\DeviceEntity;
use App\Manager\DeviceManager;
use App\Request\CreateDeviceRequest;
use App\Response\CreateDeviceResponse;
use App\Response\GetDeviceByIdResponse;
use App\Response\GetDeviceResponse;
use App\Response\UpdateDeviceResponse;

class DeviceService
{
    private $autoMapping;
    private $deviceManager;

    public function __construct(AutoMapping $autoMapping, DeviceManager $deviceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->deviceManager = $deviceManager;
    }

    public function create(CreateDeviceRequest $request)
    {
        $deviceResult = $this->deviceManager->create($request);

        return $this->autoMapping->map(DeviceEntity::class, CreateDeviceResponse::class, $deviceResult);
    }

    public function getDeviceById($request)
    {
        $result = $this->deviceManager->getDeviceById($request);

        return $this->autoMapping->map(DeviceEntity::class, GetDeviceByIdResponse::class, $result);
    }

    public function getDevicesOfUser($request)
    {
        $response = [];
        $result = $this->deviceManager->getDevicesOfUser($request);

        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map(DeviceEntity::class, GetDeviceResponse::class, $row);
        }

        return $response;
    }

    public function getAllDevices()
    {
        $response = [];
        $result = $this->deviceManager->getAllDevices();

        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map(DeviceEntity::class, GetDeviceResponse::class, $row);
        }

        return $response;
    }

    public function update($request)
    {
        $deviceResult = $this->deviceManager->update($request);

        return $this->autoMapping->map(DeviceEntity::class, UpdateDeviceResponse::class, $deviceResult);
    }

    public function delete($result)
    {
        $deviceResult = $this->deviceManager->delete($result);

        if($deviceResult == null)
        {
            return null;
        }

        return  $this->autoMapping->map(DeviceEntity::class, GetDeviceByIdResponse::class, $deviceResult);
    }
}