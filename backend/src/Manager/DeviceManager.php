<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\DeviceEntity;
use App\Repository\DeviceEntityRepository;
use App\Request\DeviceCreateRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Request\DeviceUpdateRequest;
use Doctrine\ORM\EntityManagerInterface;

class DeviceManager
{
    private $autoMapping;
    private $entityManager;
    private $deviceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, DeviceEntityRepository $deviceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->deviceEntityRepository = $deviceEntityRepository;
    }

    public function create(DeviceCreateRequest $request)
    {
        $deviceEntity = $this->autoMapping->map(DeviceCreateRequest::class, DeviceEntity::class, $request);

        $this->entityManager->persist($deviceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $deviceEntity;
    }

    public function getDeviceById(GetByIdRequest $request)
    {
        return $this->deviceEntityRepository->getDeviceById($request->getId());
    }

    public function getDevicesOfUser($userID)
    {
        return $this->deviceEntityRepository->getDevicesOfUser($userID);
    }

    public function getAllDevices()
    {
        return $this->deviceEntityRepository->getAllDevices();
    }

    public function update(DeviceUpdateRequest $request)
    {
        $deviceEntity = $this->deviceEntityRepository->find($request->getId());

        if(!$deviceEntity)
        {
            return null;
        }
        else
        {
            $deviceEntity = $this->autoMapping->mapToObject(DeviceUpdateRequest::class,
                DeviceEntity::class, $request, $deviceEntity);

            $this->entityManager->flush();

            return $deviceEntity;
        }
    }

    public function delete(DeleteRequest $request)
    {
        $deviceEntity = $this->deviceEntityRepository->getDeviceById($request->getId());
        if(!$deviceEntity )
        {

        }
        else
        {
            $this->entityManager->remove($deviceEntity);
            $this->entityManager->flush();
        }
        return $deviceEntity;
    }
}