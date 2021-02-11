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

    public function __construct(EntityManagerInterface $entityManagerInterface, ReactionEntityRepository $repository, AutoMapping $autoMapping,
                                CarManager $carManager, DeviceManager $deviceManager, RealEstateManager $realEstateManager) {

        $this->entityManager = $entityManagerInterface;
        $this->repository = $repository;
        $this->autoMapping = $autoMapping;
        $this->carManager = $carManager;
        $this->deviceManager = $deviceManager;
        $this->realEstateManager = $realEstateManager;
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

    public function getNotifications($userID)
    {
        $response = [];

        $results = $this->repository->getNotifications($userID);
        
        foreach ($results as $result)
        {
            if($result['entity'] == "car")
            {
                $car = $this->carManager->getCarOfUserById($userID, $result['itemID']);

                if($car)
                {
                    $result['entityName'] = $car[0]['brand'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "device")
            {
                $device = $this->deviceManager->getDeviceOfUserById($userID, $result['itemID']);
                
                if($device)
                {
                    $result['entityName'] = $device[0]['brand'];
                    $response[] = $result;
                }
            }
            elseif ($result['entity'] == "realEstate")
            {
                $realEstate = $this->realEstateManager->getRealEstateOfUserById($userID, $result['itemID']);

                if($realEstate)
                {
                    $result['entityName'] = $realEstate[0]['realEstateType'];
                    $response[] = $result;
                }
            }
            
        }

        return $response;
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

        //dd($this->repository->getReactionsCountOfEntity("car"));

        $response['carReactions'] = $this->repository->getReactionsCountOfEntity("car")[1];

        $response['deviceReactions'] = $this->repository->getReactionsCountOfEntity("device")[1];

        $response['realEstateReactions'] = $this->repository->getReactionsCountOfEntity("realEntity")[1];

        return $response;
    }
}
