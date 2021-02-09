<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ReportEntity;
use App\Manager\ReportManager;
use App\Request\ReportCreateRequest;
use App\Response\ReportResponse;

class ReportService
{
    private $autoMapping;
    private $reportManager;

    public function __construct(AutoMapping $autoMapping, ReportManager $reportManager)
    {
        $this->autoMapping = $autoMapping;
        $this->reportManager = $reportManager;
    }

    public function create(ReportCreateRequest $request)
    {
        $reprot = $this->reportManager->create($request);

        return $this->autoMapping->map(ReportEntity::class, ReportResponse::class, $reprot);
    }

    public function getReports()
    {
        $response = [];

        $items = $this->reportManager->getReports();

        foreach ($items as $item) 
        {
            $response[] =  $this->autoMapping->map('array', ReportResponse::class, $item);
        }
        
        return $response;
    }

    public function getReportById($id)
    {
        $response = [];

        $items = $this->reportManager->getReportById($id);
        
        foreach ($items as $row)
        {
            $response[] = $this->autoMapping->map('array', ReportResponse::class, $row);
        }

        return $response;
    }

    public function delete($request)
    {
        $result = $this->reportManager->delete($request);

        return $this->autoMapping->map(ReportEntity::class, ReportResponse::class, $result);
    }
}
