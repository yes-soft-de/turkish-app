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
                 $result['entityName'] = $this->carManager->getCarById($result['itemID'])[0]['brand'];
            }
            elseif ($result['entity'] == "device")
            {
                $result['entityName'] = $this->deviceManager->getDeviceById($result['itemID'])[0]['brand'];
            }
            elseif ($result['entity'] == "realEstate")
            {
                $result['entityName'] = $this->realEstateManager->getRealEstateById($result['itemID'])[0]['realEstateType'];
            }

            $response[] = $result;
        }

        return $response;
    }
}
