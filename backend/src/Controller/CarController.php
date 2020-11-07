<?php


namespace App\Controller;


use App\AutoMapping;
use App\Request\CarCreateRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Request\CarUpdateRequest;
use App\Service\CarService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CarController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $carService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
                                CarService $carService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->carService = $carService;
    }

    /**
     * @Route("cars", name="createCar", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class,CarCreateRequest::class, (object)$data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->carService->create($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("car/{id}", name="getCarById", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getCarById(Request $request)
    {
        $request = new GetByIdRequest($request->get('id'));

        $result = $this->carService->getCarById($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("cars", name="getCarsOfUser", methods={"GET"})
     * @return JsonResponse
     */
    public function getCarsOfUser()
    {
        $result = $this->carService->getCarsOfUser($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("all-cars", name="getAllCars", methods={"GET"})
     */
    public function getAllCars()
    {
        $result = $this->carService->getAllCars();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("cars", name="updateCar", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function update(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, CarUpdateRequest::class, (object) $data);

        $request->setCreatedBy($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->carService->update($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("cars/{id}", name="deleteCar", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     */
    public function delete(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->carService->delete($request);

        return $this->response($result, self::DELETE);
    }
    
    /**
     * @Route("carsFilter/{key}/{value}", name="filterForcars ",methods={"GET"})
     * @return JsonResponse
     */
    public function getFilter($key, $value)
    {       
        $result = $this->carService->getFilter($key, $value);

        return $this->response($result, self::FETCH);
    }
}