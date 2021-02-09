<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReportEntity;
use App\Repository\ReportEntityRepository;
use App\Request\ReportCreateRequest;
use Doctrine\ORM\EntityManagerInterface;
use App\Request\DeleteRequest;

class ReportManager
{
    private $autoMapping;
    private $entityManager;
    private $repository;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ReportEntityRepository $repository,
    CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->repository = $repository;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
    }

    public function create(ReportCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ReportCreateRequest::class, ReportEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getReports()
    {
        $results = $this->repository->getAllReports();
        
        $i = 0;
        foreach($results as $result)
        {
            $entity = $result['entity'];
            
            if($entity == "car")
            {
                $results[$i]['itemName'] = $this->carManager->getCarById($result['itemID'])[0]['carType'];
            }
            elseif ($entity == "device")
            {
                $results[$i]['itemName'] = $this->deviceManager->getDeviceById($result['itemID'])[0]['brand'];
            }
            elseif ($entity == "realEstate")
            {
                $results[$i]['itemName'] = $this->realEstateManager->getRealEstateById($result['itemID'])[0]['realEstateType'];
            }
            
            $i++;
        }

        return $results;
    }

    public function getReportById($id)
    {
        $report = $this->repository->getReportById($id);

        $entity = $report[0]['entity'];
        
        if($entity == "car")
        {
            $report[0]['itemName'] = $this->carManager->getCarById($report[0]['itemID'])[0]['carType'];
        }
        elseif ($entity == "device")
        {
            $report[0]['itemName'] = $this->deviceManager->getDeviceById($report[0]['itemID'])[0]['brand'];
        }
        elseif ($entity == "realEstate")
        {
            $report[0]['itemName'] = $this->realEstateManager->getRealEstateById($report[0]['itemID'])[0]['realEstateType'];
        }

        return $report;
    }

    public function delete(DeleteRequest $request)
    {
        $item = $this->repository->find($request->getId());
        
        if(!$item )
        {

        }
        else
        {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
        }

        return $item;
    }

    public function deleteAll()
    {
        return $this->repository->deleteAll();
    }
}
