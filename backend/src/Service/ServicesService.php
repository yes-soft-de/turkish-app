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
    private $commentService;

    public function __construct(AutoMapping $autoMapping, ServicesManager $servicesManager, ParameterBagInterface $params,
     ReactionService $reactionService, CommentService $commentService)
    {
        $this->autoMapping = $autoMapping;
        $this->servicesManager = $servicesManager;
        $this->reactionService = $reactionService;
        $this->commentService = $commentService;
        
        $this->params = $params->get('upload_base_url').'/';
    }

    public function create(ServiceCreateRequest $request)
    {
        $serviceRegister = $this->servicesManager->create($request);

        return $this->autoMapping->map(ServicesEntity::class, ServiceCreateResponse::class, $serviceRegister);
    }

    public function getServicesById($serviceID, $userID)
    {
        $servicesResponse = [];

        $results = $this->servicesManager->getServicesById($serviceID);

        foreach($results as $result)
        {
            if((is_string($userID) && $result['createdBy'] != $userID) || (is_int($userID) && $userID == 0))
            {
                $result['editable'] = false;
            }
            elseif(is_string($userID) && $result['createdBy'] == $userID)
            {
                $result['editable'] = true;
            }

            $result['image'] = $this->params . $result['image'];

            $result['userImage'] = $this->params . $result['userImage'];

            $result['reaction'] = $this->reactionService->reactionforItem($result['id'], $result['type'])[0];
            
            ($result['reaction']['createdBy'] == $userID) ?  $result['reaction']['createdBy'] = true : $result['reaction']['createdBy'] = false ;

            $result['comments'] = $this->commentService->getCommentsByEntityAndItemID($result['type'], $result['id']);

            $servicesResponse = $this->autoMapping->map('array', ServiceGetByIdResponse::class, $result);
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

            $row['reaction']=$this->reactionService->reactionforItem($row['id'], $row['type']);
            
            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->servicesManager->getServiceCommentsNumber($row['type'], $row['id'])[1];
            
            $response[] = $this->autoMapping->map('array', ServicesGetResponse::class, $row);
        }

        return $response;
    }

    public function getServicesOfUser($userID)
    {
        $response = [];
        $result = $this->servicesManager->getServicesOfUser($userID);

        foreach ($result as $row)
        {
            $row['image'] = $this->params . $row['image'];

            $row['userImage'] = $this->params . $row['userImage'];

            $row['reaction']= $this->reactionService->reactionforItem($row['id'], $row['type']);

            ($row['reaction'][0]['createdBy'] == $userID) ?  $row['reaction'][0]['createdBy'] = true : $row['reaction'][0]['createdBy'] = false ;
          
            $row['commentsNumber'] = $this->servicesManager->getServiceCommentsNumber($row['type'], $row['id'])[1];

            $response[] = $this->autoMapping->map('array', ServicesGetResponse::class, $row);
        }

        return $response;
    }

    public function getServicesByQuery($brand)
    {
        $response = [];

        $results = $this->servicesManager->getServicesByQuery($brand);

        foreach ($results as $result)
        {
            $result['image'] = $this->params . $result['image'];

            $result['userImage'] = $this->params . $result['userImage'];

            $result['reaction']=$this->reactionService->reactionforItem($result['id'], $result['type']);
          
            $result['commentsNumber'] = $this->servicesManager->getServiceCommentsNumber($result['type'], $result['id'])[1];

            $response[] = $this->autoMapping->map('array', ServicesGetResponse::class, $result);
        }

        return $response;
    }

    public function update($request)
    {
        $serviceResult = $this->servicesManager->update($request);

        return $this->autoMapping->map(ServicesEntity::class, ServicesGetResponse::class, $serviceResult);
    }

    public function delete($result)
    {
        $serviceResult = $this->servicesManager->delete($result);

        if($serviceResult == null)
        {
            return null;
        }

        return  $this->autoMapping->map(ServicesEntity::class, ServiceGetByIdResponse::class, $serviceResult);
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

}