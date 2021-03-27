<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ServicesEntity;
use App\Manager\ServicesManager;
use App\Request\ServiceCreateRequest;
use App\Response\ServiceCreateResponse;
use App\Response\ServiceGetByIdResponse;
use App\Response\ServicesGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ServicesService
{
    private $autoMapping;
    private $servicesManager;
    private $reactionService;
    private $params;

    public function __construct(AutoMapping $autoMapping, ServicesManager $servicesManager, ParameterBagInterface $params,
     ReactionService $reactionService)
    {
        $this->autoMapping = $autoMapping;
        $this->servicesManager = $servicesManager;
        $this->services = $reactionService;
        
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
            $result['image'] = $this->params . $result['image'];

            $result['userImage'] = $this->params . $result['userImage'];

            $servicesResponse[] = $this->autoMapping->map('array', ServiceGetByIdResponse::class, $result);
        }

        return $servicesResponse;
    }

    public function getAllServices($userID)
    {
        $response = [];
        $result = $this->servicesManager->getAllServices();

        foreach ($result as $row)
        {
            $row['image'] = $this->params . $row['image'];
            $row['userImage'] = $this->params . $row['userImage'];

            // $row['reaction']=$this->reactionService->reactionforItem($row['id']);
            // //dd($row['reaction']);
            // ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $response[] = $this->autoMapping->map('array', ServicesGetResponse::class, $row);
        }

        return $response;
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

}