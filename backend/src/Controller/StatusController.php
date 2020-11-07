<?php

namespace App\Controller;

use App\AutoMapping;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Request\StatusCreateRequest;
use App\Request\StatusUpdateRequest;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use App\Service\StatusService;

class StatusController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $statusService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, StatusService $statusService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->statusService = $statusService;
    }

    /**
     * @Route("status", name="CreateNewStatus", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function statusCreate(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, StatusCreateRequest::class, (object) $data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->statusService->statusCreate($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("status", name="updateStatus", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse|Response
     */
    public function statusUpdate(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        $request = $this->autoMapping->map(\stdClass::class, StatusUpdateRequest::class, (object) $data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }
        
        $result = $this->statusService->statusUpdate( $this->getUserId(), $request);
        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("status", name="GetAgreementsOfASpecificUser", methods={"GET"})
     * @return JsonResponse
     */
    public function getAgreements()
    {
        $result = $this->statusService->getAgreements($this->getUserId());
        
        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/getAgreementID/{ID}", name="GetAgreementsByID", methods={"GET"})
     * @return JsonResponse
     */
    public function getAgreementID($ID)
    {
        $result = $this->statusService->getAgreementID($ID);
        
        return $this->response($result, self::FETCH);
    }
}
