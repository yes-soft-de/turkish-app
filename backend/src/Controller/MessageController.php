<?php

namespace App\Controller;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Request\ChatCreateRequest;
use App\Service\MessageService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MessageController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $messageService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
                                MessageService $messageService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->messageService = $messageService;
    }

    /**
     * @Route("/chat", name="", methods={"POST"})
     */
    public function chatWithOwner(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, ChatCreateRequest::class, (object) $data);

        $request->setUserOne($this->getUserId());
        
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->messageService->chatWithOwner($request);

        return $this->response($result, self::FETCH);
    }
}