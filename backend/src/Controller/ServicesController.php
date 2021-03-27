<?php


namespace App\Controller;


use App\AutoMapping;
use App\Request\ServiceCreateRequest;
use App\Service\ServicesService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ServicesController extends BaseController
{
    private $autoMapping;
    private $servicesService;
    private $validator;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
     ServicesService $servicesService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->servicesService = $servicesService;
        $this->validator = $validator;
    }

    /**
     * @Route("service", name="createService", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ServiceCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());
        
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->servicesService->create($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("services/{serviceID}", name="getServicesOfSignedInUser", methods={"GET"})
     * @return JsonResponse
     */
    public function getServiceById($serviceID)
    {
        $result = $this->servicesService->getServicesById($serviceID);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("services", name="getAllServices", methods={"GET"})
     * @return JsonResponse
     */
    public function getServices()
    {
        $result = $this->servicesService->getAllServices($this->getUserId());

        return $this->response($result, self::FETCH);
    }

}