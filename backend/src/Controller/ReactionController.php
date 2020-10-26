<?php

namespace App\Controller;

use App\AutoMapping;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Request\ReactionCreateRequest;
use App\Request\GetByIdRequest;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use App\Service\ReactionService;

class ReactionController extends BaseController
{ 
    private $autoMapping;
    private $validator;
    private $reactionService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ReactionService $reactionService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->reactionService = $reactionService;
    }

    /**
     * @Route("/reactions", name="InsertNewReaction", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function create(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        $request = $this->autoMapping->map(\stdClass::class, ReactionCreateRequest::class, (object) $data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->reactionService->reactionCreate($request);
        
        return $this->response($result, self::CREATE);
    }

     /**
     * @Route("/reactions/{itemID}", name="GetAllReactionsForSpecificItem", methods={"GET"})
     * @return JsonResponse
     */
    public function getAll(request $request, $itemID)
    {
        $data = json_decode($request->getContent(), true);

        $result = $this->reactionService->getAll($data, $itemID);
        
        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/reactionss/{userID}", name="GetAllReactionsForSpecificUser", methods={"GET"})
     * @param $userID
     * @return JsonResponse
     */
    public function getReactionsForUser($userID)
    {
        $result = $this->reactionService->getReactionsForUser($userID);
        return $this->response($result, self::FETCH);
    }


}
