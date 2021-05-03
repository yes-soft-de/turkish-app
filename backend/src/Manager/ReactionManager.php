<?php
namespace App\Manager;

use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Repository\ReactionEntityRepository;
use App\Request\ReactionCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ReactionManager
{
    private $entityManager;
    private $repository;
    private $autoMapping;
    private $carManager;
    private $deviceManager;
    private $realEstateManager;
    private $servicesManager;
    private $commentManager;
    private $messageManager;

    public function __construct(EntityManagerInterface $entityManagerInterface, ReactionEntityRepository $repository, AutoMapping $autoMapping,
                                CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager, 
                                ServicesManager $servicesManager, CommentManager $commentManager, MessageManager $messageManager) {

        $this->entityManager = $entityManagerInterface;
        $this->repository = $repository;
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
        $this->servicesManager = $servicesManager;
        $this->commentManager = $commentManager;
        $this->messageManager = $messageManager;
    }

    public function reactionCreate(ReactionCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ReactionCreateRequest::class, ReactionEntity::class, $request);
       
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getAll($data, $itemID)
    {
        return $this->repository->getAll($data['entity'], $itemID);
    }

    public function getReactionsForUser($userID)
    {
        return $this->repository->getReactionsForUser($userID);
    }

    public function getReactionForUser($data, $itemID, $userID)
    {
        return $this->repository->getReactionForUser($data['entity'], $itemID, $userID);
    }

    public function reactionAll($ID, $entity)
    {
        return $this->repository->reactionAll($ID, $entity);
    }

    public function reactionforItem($ID, $entity)
    {
        return $this->repository->reactionforItem($ID, $entity);
    }

    public function getReactionsOfUser($userID)
    {
        $response = [];

        $results = $this->repository->getReactionsOfUser($userID);
        
        foreach ($results as $result)
        {
            if($result['entity'] == "car")
            {
                $car = $this->carManager->getCarOfUserById($userID, $result['itemID']);

                if($car)
                {
                    $result['entityName'] = $car[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "device")
            {
                $device = $this->deviceManager->getDeviceOfUserById($userID, $result['itemID']);
                
                if($device)
                {
                    $result['entityName'] = $device[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "realEstate")
            {
                $realEstate = $this->realEstateManager->getRealEstateOfUserById($userID, $result['itemID']);

                if($realEstate)
                {
                    $result['entityName'] = $realEstate[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] != null)
            {
                $services = $this->servicesManager->getServiceOfUserById($userID, $result['itemID']);

                if($services)
                {
                    $result['entityName'] = $services[0]['title'];
                    $response[] = $result;
                }
            }
            
        }

        return $response;
    }

    public function getComments($userID)
    {
        $response = [];

        $results = $this->commentManager->getCommentsByUser($userID);
        
        foreach ($results as $result)
        {
            if($result['entity'] == "car")
            {
                $car = $this->carManager->getCarOfUserById($userID, $result['itemID']);

                if($car)
                {
                    $result['entityName'] = $car[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "device")
            {
                $device = $this->deviceManager->getDeviceOfUserById($userID, $result['itemID']);
                
                if($device)
                {
                    $result['entityName'] = $device[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "realEstate")
            {
                $realEstate = $this->realEstateManager->getRealEstateOfUserById($userID, $result['itemID']);

                if($realEstate)
                {
                    $result['entityName'] = $realEstate[0]['title'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] != null)
            {
                $services = $this->servicesManager->getServiceOfUserById($userID, $result['itemID']);

                if($services)
                {
                    $result['entityName'] = $services[0]['title'];
                    $response[] = $result;
                }
            }
            
        }

        return $response;
    }

    public function getChatListOfUser($userID)
    {
        return $this->messageManager->getChatListOfUser($userID);
    }

    public function checkUserLoved($itemID, $userID, $entity)
    {
        $loved = $this->repository->checkUserLoved($itemID, $userID, $entity);

        if ($loved[1] > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function removeReaction($userID, $entity, $itemID)
    {
        $data['entity'] = $entity;

        $reaction = $this->getReactionForUser($data, $itemID, $userID);

        if($reaction)
        {
            $this->entityManager->remove($reaction[0]);
            $this->entityManager->flush();
        }

        return $reaction[0];
    }

    public function delete($id)
    {
        $reaction = $this->repository->find($id);

        if($reaction)
        {
            $this->entityManager->remove($reaction);
            $this->entityManager->flush();
        }
        else
        {
            return null;
        }

        return $reaction;
    }

    public function getAllReactions()
    {
        $response = [];

        $response['total'] = count($this->repository->findAll());

        $response['carReactions'] = $this->repository->getReactionsCountOfEntity("car")[1];

        $response['deviceReactions'] = $this->repository->getReactionsCountOfEntity("device")[1];

        $response['realEstateReactions'] = $this->repository->getReactionsCountOfEntity("realEntity")[1];

        $response['services'] = $response['total'] - ($response['carReactions'] + $response['deviceReactions'] + $response['realEstateReactions']);
        
        return $response;
    }
}
