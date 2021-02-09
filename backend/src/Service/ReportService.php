<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ReportEntity;
use App\Manager\ReportManager;
use App\Request\ReportCreateRequest;
use App\Response\ReportResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ReportService
{
    private $autoMapping;
    private $reportManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ReportManager $reportManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->reportManager = $reportManager;

        $this->params = $params->get('upload_base_url') . '/';
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
            $item['image'] = $this->params . $item['image'];

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
            $row['image'] = $this->params . $row['image'];

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
