<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\DocumentEntity;
use App\Manager\DocumentManager;
use App\Response\DocumentResponse;
use App\Response\DocumentCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class DocumentService
{
    private $autoMapping;
    private $documentManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, DocumentManager $documentManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->documentManager = $documentManager;
        $this->params = $params->get('upload_base_url').'/';;
    }

    public function documentCreate($request)
    {
        $documentCreate = $this->documentManager->documentCreate($request);

        return $this->autoMapping->map(DocumentEntity::class,DocumentCreateResponse::class, $documentCreate);
    }

    public function getDocuments($id, $entity)
    {
        $documentsResponse = [];

        $documents = $this->documentManager->getDocuments($id, $entity);

        foreach ($documents as $document)
        {
            $document['image']= $this->specialLinkCheck($document['specialLink']).$document['image'];
            $documentsResponse[] = $this->autoMapping->map('array', DocumentResponse::class, $document);
        }

        return $documentsResponse;
    }

    public function specialLinkCheck($bool)
    {
        if ($bool == false)
        {
            return $this->params;
        }
    }
}