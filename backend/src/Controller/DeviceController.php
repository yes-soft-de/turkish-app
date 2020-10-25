<?php


namespace App\Controller;


use App\AutoMapping;
use App\Request\CreateDeviceRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Request\UpdateDeviceRequest;
use App\Service\DeviceService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class DeviceController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $deviceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
                                DeviceService $deviceService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->deviceService = $deviceService;
    }

    /**
     * @Route("devices", name="createDevice", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class,CreateDeviceRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->deviceService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("device/{id}", name="getDeviceById", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getCarById(Request $request)
    {
        $request = new GetByIdRequest($request->get('id'));

        $result = $this->deviceService->getDeviceById($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("devices/{createdBy}", name="getDevicesOfUser", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getDevicesOfUser(Request $request)
    {
        $result = $this->deviceService->getDevicesOfUser($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("devices", name="getAllDevices", methods={"GET"})
     */
    public function getAllDevices()
    {
        $result = $this->deviceService->getAllDevices();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("devices", name="updateDevice", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, UpdateDeviceRequest::class, (object) $data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->deviceService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("devices/{id}", name="deleteDevice", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->deviceService->delete($request);

        return $this->response($result, self::DELETE);
    }
}