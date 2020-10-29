<?php

namespace App\Controller;

use App\AutoMapping;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Request\RealEstateCreateRequest;
use App\Request\RealEstateUpdateRequest;
use App\Request\GetByIdRequest;
use App\Request\DeleteRequest;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use App\Service\RealEstateService;
class RealEstateController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $realEstateService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, RealEstateService $realEstateService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->realEstateService = $realEstateService;
    }
    /**
     * @Route("/real-estate", name="CreateNewRealEstate", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function statusCreate(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, RealEstateCreateRequest::class, (object) $data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->realEstateService->realEstateCreate($request);

        return $this->response($response, self::CREATE);
    } 
    
    /**
     * @Route("/real-estate/{ID}", name="GetAnItemByID",methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getRealEstateById(Request $request)
    {
        $request = new GetByIdRequest($request->get('ID'));
       
        $result = $this->realEstateService->getRealEstateById($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/all-real-estate", name="GetAllItems",methods={"GET"})
     * @return JsonResponse
     */
    public function getAllRealEstate()
    {       
        $result = $this->realEstateService->getAllRealEstate();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("real-estates", name="GetAllItemsOfSpecificUser",methods={"GET"})
     * @return JsonResponse
     */
    public function getRealEstateByUser()
    {       
        $result = $this->realEstateService->getRealEstateByUser($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/real-estate", name="UpdateAnExistingItem", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse|Response
     */
    public function realEstateUpdate(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        $request = $this->autoMapping->map(\stdClass::class, RealEstateUpdateRequest::class, (object) $data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }
        
        $result = $this->realEstateService->realEstateUpdate($request);
        return $this->response($result, self::UPDATE);
    } 

    /**
     * @Route("/real-estate/{ID}", name="DeleteItem", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('ID'));
        $result = $this->realEstateService->delete($request);
        return $this->response("deleted ", self::DELETE);
    }
}
