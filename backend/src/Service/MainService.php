<?php


namespace App\Service;


use App\AutoMapping;

class MainService
{
    private $autoMapping;
    private $carService;
    private $deviceService;
    private $realEstateService;

    public function __construct(AutoMapping $autoMapping, DeviceService $deviceService, RealEstateService $realEstateService,
     CarService $carService)
    {
        $this->autoMapping = $autoMapping;
        $this->carService = $carService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;
    }

    public function search($query)
    {
        $response = [];

        $carsResult = $this->carService->getCarsByBrand($query);

        $devicesResult = $this->deviceService->getDevicesByBrand($query);

        $realEstatesResult = $this->realEstateService->getRealEstatesByType($query);

        $response = array_merge_recursive($carsResult, $devicesResult, $realEstatesResult);

        //dd($realEstatesResult);

        return $response;
    }

}