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
    private $commentManager;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, DeviceEntityRepository $deviceEntityRepository,
     CommentManager $commentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->deviceEntityRepository = $deviceEntityRepository;
        $this->commentManager = $commentManager;
    }

    public function create(DeviceCreateRequest $request)
    {
        $deviceEntity = $this->autoMapping->map(DeviceCreateRequest::class, DeviceEntity::class, $request);
        
        $this->entityManager->persist($deviceEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $deviceEntity;
    }

    public function getDeviceById($id)
    {
        return $this->deviceEntityRepository->getDeviceById($id);
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

            if($request->getStatus() == "sold" && $deviceEntity->getCompleteDate() == null)
            {
                $deviceEntity->setCompleteDate(new \DateTime('Now'));
            }

            $this->entityManager->flush();

            return $deviceEntity;
        }
    }

    public function delete(DeleteRequest $request)
    {
        $deviceEntity = $this->deviceEntityRepository->find($request->getId());

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

    public function getFilter($price, $price_2, $city)
    {
        if ($city != null && $price == null && $price_2 == null)
        {
            return $this->deviceEntityRepository->getFilterCity($city);
        }

        elseif ($price != null && $city == null && $price_2 == null)
        {
            return $this->deviceEntityRepository->getFilterPrice($price);
        }

        elseif ($price != null && $city != null && $price_2 == null)
        {
            return $this->deviceEntityRepository->getFilterByPriceAndCity($price, $city);
        }

        elseif ($price != null && $price_2 != null && $city == null)
        {
            return $this->deviceEntityRepository->getFilterByTwoPrices($price, $price_2);
        }

        elseif ($price != null && $price_2 != null && $city != null)
        {
            return $this->deviceEntityRepository->getFilterByTwoPricesAndCity($price, $price_2, $city);
        }

        elseif ($price == null && $city == null && $price_2 != null)
        {
            return $this->deviceEntityRepository->getFilterPrice($price_2);
        }

        elseif ($price == null && $city != null && $price_2 != null)
        {
            return $this->deviceEntityRepository->getFilterByPriceAndCity($price_2, $city);
        }

        elseif ($price == null && $city == null && $price_2 == null)
        {
            return $this->deviceEntityRepository->getAllDevices();
        }
    }

    public function getDevicesByBrand($brand)
    {
        return $this->deviceEntityRepository->getDevicesByBrand($brand);
    }

    public function getSoldDevicesOfUser($userID)
    {
        $devices = $this->deviceEntityRepository->getSoldDevicesOfUser($userID);

        if($devices != null)
        {
            $devices[0]['state'] = "Sell";
        }

        return $devices;
    }

    public function getDeviceOfUserById($userID, $id)
    {
        return $this->deviceEntityRepository->getDeviceOfUserById($userID, $id);
    }

    public function getDeviceCommentsNumber($id)
    {
        return $this->commentManager->getCommentsNumber("device", $id);
    }
    
}