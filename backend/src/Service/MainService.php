<?php


namespace App\Service;


use App\AutoMapping;
use App\Manager\MainManager;
use App\Request\FilterRequest;
use App\Response\GetHistoryResponse;
use App\Response\GetStatisticsResponse;

class MainService
{
    private $autoMapping;
    private $mainManager;
    private $carService;
    private $deviceService;
    private $realEstateService;
    private $statusService;
    private $servicesService;

    public function __construct(AutoMapping $autoMapping, DeviceService $deviceService, RealEstateService $realEstateService,
     CarService $carService, StatusService $statusService, MainManager $mainManager, ServicesService $servicesService)
    {
        $this->autoMapping = $autoMapping;
        $this->mainManager = $mainManager;
        $this->carService = $carService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;
        $this->statusService = $statusService;
        $this->servicesService = $servicesService;
    }

    public function search($query)
    {
        $response = [];

        $carsResult = $this->carService->getCarsByType($query);

        $devicesResult = $this->deviceService->getDevicesByBrand($query);

        $realEstatesResult = $this->realEstateService->getRealEstatesByType($query);

        $servicesResult = $this->servicesService->getServicesByQuery($query);

        $response = array_merge_recursive($carsResult, $devicesResult, $realEstatesResult, $servicesResult);

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
        elseif ($entity == "service")
        {
            return $this->servicesService->getFilter($request->getPrice(), $request->getPrice2(), $request->getCity(), $request->getCategoryID());
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

    public function getUserProperties($userID)
    {
        $response = [];

        $response['cars'] = $this->carService->getCarsOfUser($userID);

        $response['devices'] = $this->deviceService->getDevicesOfUser($userID);

        $response['realEstate'] = $this->realEstateService->getRealEstateByUser($userID);

        $response['services'] = $this->servicesService->getServicesOfUser($userID);

        return $response;
    }

    public function getStatistics()
    {
        $response = [];

        $results = $this->mainManager->getStatistics();

        $response[] = $this->autoMapping->map('array', GetStatisticsResponse::class, $results);

        return $response;
    }

    public function getAdvertisements($userID)
    {
        $response = [];

        $cars = $this->carService->getAllCars($userID);

        $devices = $this->deviceService->getAllDevices($userID);

        $realEstates = $this->realEstateService->getAllRealEstate($userID);

        $services = $this->servicesService->getAllServices($userID);

        $response = array_merge_recursive($cars, $devices, $realEstates, $services);

        shuffle($response);

        return $response;
    }
}