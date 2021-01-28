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

        $this->entityManager->persist($Entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $Entity;
    }

    public function statusUpdate($userID, StatusUpdateRequest $request)
    {
        $Entity = $this->statusRepository->findByUserIDAndID( $userID, $request->getId());
        
        if (!$Entity) {

        } else {
            $Entity = $this->autoMapping->mapToObject(StatusUpdateRequest::class, StatusEntity::class, $request, $Entity);

            if($request->getStatus() == "finished")
            {
                $Entity->setCompleteDate(new \DateTime('Now'));
            }

            $this->entityManager->flush();
        }
        return $Entity;
    }

    public function getAgreements($userID)
    {
        return $this->statusRepository->getAgreements($userID);
    }

    public function getAgreementID($ID)
    {
        return $this->statusRepository->getAgreementID($ID);
    }

    public function getFinishedAgreementsOfUser($userID)
    {
        return $this->statusRepository->getFinishedAgreementsOfUser($userID);
    }
}