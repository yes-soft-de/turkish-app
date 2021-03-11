<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ServicesEntity;
use App\Manager\ServicesManager;
use App\Request\ServiceCreateRequest;
use App\Response\ServiceCreateResponse;
use App\Response\ServiceGetByIdResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ServicesService
{
    private $autoMapping;
    private $servicesManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ServicesManager $servicesManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->servicesManager = $servicesManager;
        
        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(ServiceCreateRequest $request)
    {
        $serviceRegister = $this->servicesManager->create($request);

        return $this->autoMapping->map(ServicesEntity::class, ServiceCreateResponse::class, $serviceRegister);
    }

    public function getServicesById($serviceID)
    {
        $servicesResponse = [];

        $results = $this->servicesManager->getServicesById($serviceID);

        foreach($results as $result)
        {
            $servicesResponse[] = $this->autoMapping->map('array', ServiceGetByIdResponse::class, $result);
        }

        return $servicesResponse;
    }

}