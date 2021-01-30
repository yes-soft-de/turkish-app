<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\ImageEntity;
use App\Repository\ImageEntityRepository;
use App\Request\DeleteRequest;
use App\Request\ImageCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ImageManager
{
    private $autoMapping;
    private $entityManager;
    private $imageEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ImageEntityRepository $imageEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->imageEntityRepository = $imageEntityRepository;
    }

    public function imageCreate(ImageCreateRequest $request)
    {
        $imageCreate = $this->autoMapping->map(ImageCreateRequest::class, ImageEntity::class, $request);

        $this->entityManager->persist($imageCreate);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $imageCreate;
    }

    public function getImages($id, $entity)
    {
        return $this->imageEntityRepository->getImages($id, $entity);
    }

    public function delete(DeleteRequest $request)
    {
        $imageEntity = $this->imageEntityRepository->find($request->getId());

        if(!$imageEntity )
        {
            return null;
        }
        else
        {
            $this->entityManager->remove($imageEntity);
            $this->entityManager->flush();
        }

        return $imageEntity;
    }
}