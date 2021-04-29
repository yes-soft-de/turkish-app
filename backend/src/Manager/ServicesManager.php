<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\ServicesEntity;
use App\Repository\ServicesEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ServiceCreateRequest;
use App\Request\ServicesUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ServicesManager
{
    private $autoMapping;
    private $entityManager;
    private $servicesEntityRepository;
    private $commentManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, 
    ServicesEntityRepository $servicesEntityRepository, CommentManager $commentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->servicesEntityRepository = $servicesEntityRepository;
        $this->commentManager = $commentManager;
    }

    public function create(ServiceCreateRequest $request)
    {
        $serviceEntity = $this->autoMapping->map(ServiceCreateRequest::class, ServicesEntity::class, $request);

        $this->entityManager->persist($serviceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $serviceEntity;
    }
    
    public function getServicesById($serviceID)
    {
        return $this->servicesEntityRepository->getServicesById($serviceID);
    }

    public function getAllServices()
    {
        return $this->servicesEntityRepository->getAllServices();
    }

    public function update(ServicesUpdateRequest $request)
    {
        $serviceEntity = $this->servicesEntityRepository->find($request->getId());
        
        if(!$serviceEntity)
        {
            return null;
        }
        else
        {
            $serviceEntity = $this->autoMapping->mapToObject(ServicesUpdateRequest::class,
                ServicesEntity::class, $request, $serviceEntity);

            $this->entityManager->flush();

            return $serviceEntity;
        }
    }

    public function delete(DeleteRequest $request)
    {
        $serviceEntity = $this->servicesEntityRepository->find($request->getId());

        if(!$serviceEntity )
        {

        }
        else
        {
            $this->entityManager->remove($serviceEntity);
            $this->entityManager->flush();
        }

        return $serviceEntity;
    }

    public function getServiceCommentsNumber($type, $id)
    {
        return $this->commentManager->getCommentsNumber($type, $id);
    }

    public function getServicesOfUser($userID)
    {
        return $this->servicesEntityRepository->getServicesOfUser($userID);
    }

    public function getServicesByQuery($query)
    {
        return $this->servicesEntityRepository->getServicesByQuery($query);
    }
    
    public function getServiceOfUserById($userID, $id)
    {
        return $this->servicesEntityRepository->getServiceOfUserById($userID, $id);
    }

    public function getServicesByType($type)
    {
        return $this->servicesEntityRepository->getServicesByType($type);
    }

}