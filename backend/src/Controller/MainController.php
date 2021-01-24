<?php


namespace App\Controller;


use App\AutoMapping;
use App\Service\MainService;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class MainController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $mainService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator,
                                MainService $mainService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->mainService = $mainService;
    }

    /**
     * @Route("search/{query}", name="searchByBrand", methods={"GET"})
     */
    public function search($query)
    {
        $result = $this->mainService->search($query);

        return $this->response($result, self::FETCH);
    }

}