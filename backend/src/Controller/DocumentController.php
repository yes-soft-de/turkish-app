<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DocumentCreateRequest;
use App\Service\DocumentService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class DocumentController extends BaseController
{
    private $validator;
    private $autoMapping;
    private $documentService;

    public function __construct(ValidatorInterface $validator, SerializerInterface $serializer, AutoMapping $autoMapping, DocumentService $documentService)
    {
        parent::__construct($serializer);

        $this->validator = $validator;
        $this->autoMapping = $autoMapping;
        $this->documentService = $documentService;
    }

    /**
     * @Route("/document", name="saveDocumentImages", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function saveDocuments(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class,DocumentCreateRequest::class,(object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->documentService->documentCreate($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("documents/{itemID}/{entity}", name="getDocuments", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getDocuments($itemID, $entity)
    {
        $result = $this->documentService->getDocuments($itemID, $entity);

        return $this->response($result, self::FETCH);
    }
}
