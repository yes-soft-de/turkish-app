<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\StatusEntity;
use App\Repository\StatusEntityRepository;
use App\Request\StatusCreateRequest;
use App\Request\StatusUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class StatusManager
{
    private $autoMapping;
    private $entityManager;
    private $statusRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, StatusEntityRepository $statusRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->statusRepository = $statusRepository;
    }

    public function statusCreate(StatusCreateRequest $request)
    {
        $Entity = $this->autoMapping->map(StatusCreateRequest::class, StatusEntity::class, $request);

        $Entity->setCreatedAt();

        $this->entityManager->persist($Entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $Entity;
    }

    public function statusupdate(StatusUpdateRequest $request)
    {
        $Entity = $this->statusRepository->find($request->getId());
        
        if (!$Entity) {

        } else {
            $Entity = $this->autoMapping->mapToObject(StatusUpdateRequest::class, StatusEntity::class, $request, $Entity);
            $this->entityManager->flush();
        }
        return $Entity;
    }

    public function getAgreements($userID)
    {
        $result = $this->statusRepository->getAgreements($userID);

        return $result;
    }
}