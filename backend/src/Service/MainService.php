<?php


namespace App\Service;


use App\AutoMapping;
use App\Manager\MainManager;
use App\Request\FilterRequest;
use App\Response\GetHistoryResponse;

class MainService
{
    private $autoMapping;
    private $mainManager;
    private $carService;
    private $deviceService;
    private $realEstateService;
    private $statusService;

    public function __construct(AutoMapping $autoMapping, DeviceService $deviceService, RealEstateService $realEstateService,
     CarService $carService, StatusService $statusService, MainManager $mainManager)
    {
        $this->autoMapping = $autoMapping;
        $this->mainManager = $mainManager;
        $this->carService = $carService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;
        $this->statusService = $statusService;
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

    public function filter(FilterRequest $request)
    {
        $entity = $request->getEntity();

        if($entity == "car")
        {
            return $this->carService->getFilter($request->getPrice(), $request->getPrice2(), $request->getCity());
        }
        elseif ($entity == "device")
        {
            return $this->deviceService->getFilter($request->getPrice(), $request->getPrice2(), $request->getCity());
        }
        elseif ($entity == "realEstate")
        {
            return $this->realEstateService->getFilter($request->getPrice(), $request->getPrice2(), $request->getCity());
        }
    }

    public function getHistory($userID)
    {
        $response = [];

        $userProperties = $this->mainManager->getHistory($userID);

        foreach ($userProperties as $boughtProperty)
        {
                $response[] = $this->autoMapping->map('array', GetHistoryResponse::class, $boughtProperty);
        }

        return $response;
    }
}