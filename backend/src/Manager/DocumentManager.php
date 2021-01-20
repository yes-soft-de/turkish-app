<?php


namespace App\Manager;


use App\AutoMapping;
use App\Entity\DocumentEntity;
use App\Repository\DocumentEntityRepository;
use App\Request\DocumentCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class DocumentManager
{
    private $autoMapping;
    private $entityManager;
    private $documentRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, DocumentEntityRepository $documentRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->documentRepository = $documentRepository;
    }

    public function documentCreate(DocumentCreateRequest $request)
    {
        $Create = $this->autoMapping->map(DocumentCreateRequest::class, DocumentEntity::class, $request);

        $this->entityManager->persist($Create);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $Create;
    }

    public function getDocuments($id, $entity)
    {
        return $this->documentRepository->getDocuments($id, $entity);
    }
}