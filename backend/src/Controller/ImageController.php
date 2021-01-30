<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\DeleteRequest;
use App\Request\ImageCreateRequest;
use App\Service\ImageService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ImageController extends BaseController
{
    private $validator;
    private $autoMapping;
    private $imageService;

    public function __construct(ValidatorInterface $validator, SerializerInterface $serializer, AutoMapping $autoMapping, ImageService $imageService)
    {
        parent::__construct($serializer);

        $this->validator = $validator;
        $this->autoMapping = $autoMapping;
        $this->imageService = $imageService;
    }

    /**
     * @Route("/image", name="saveImages", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function saveImages(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class,ImageCreateRequest::class,(object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->imageService->imageCreate($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/itemimages/{entity}/{id}", name="getImagesOfItem", methods={"GET"})
     */
    public function getItemImages($entity, $id)
    {
        $result = $this->imageService->getImages($id, $entity);

        return $this->respond($result, self::FETCH);
    }

    /**
     * @Route("/deleteimage/{id}", name="deleteAnImage", methods={"DELETE"})
     * @param Request $request
     * @return JsonResponse
     */
    public function deleteImage(Request $request)
    {
        $request = new DeleteRequest($request->get('id'));

        $result = $this->imageService->delete($request);

        return $this->response($result, self::DELETE);
    }
}
