<?php


namespace App\Controller;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Entity\DeviceEntity;
use App\Entity\DocumentEntity;
use App\Entity\ImageEntity;
use App\Entity\MessageEntity;
use App\Entity\ReactionEntity;
use App\Entity\RealEstateEntity;
use App\Entity\SettingEntity;
use App\Entity\StatusEntity;
use App\Entity\UserEntity;
use App\Entity\UserProfileEntity;
use App\Request\FilterRequest;
use App\Service\MainService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
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

    /**
     * @Route("filter", name="filterBy", methods={"POST"})
     */
    public function filter(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, FilterRequest::class, (object) $data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0)
        {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->mainService->filter($request);

        return $this->response($result, self::FETCH);
    }

    /**
     * This API brings back the previous Sell and Buy operations of the user
     *
     * @Route("/history", name="getHistory", methods={"GET"})
     */
    public function getHistory()
    {
        $result = $this->mainService->getHistory($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/userproperties", name="getAllUserProperties", methods={"GET"})
     */
    public function getUserProperties()
    {
        $result = $this->mainService->getUserProperties($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("statistics", name="getStatistics", methods={"GET"})
     */
    public function getStatistics()
    {
        $result = $this->mainService->getStatistics();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/advertisements", name="getAllAdvertisements", methods={"GET"})
     * @return JsonResponse
     */
    public function getAllAdvertisements()
    {
        $result = $this->mainService->getAdvertisements($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/eraseall", name="deleteAllData", methods={"DELETE"})
     */
    public function eraseAllData()
    {
        try
        {
            $em = $this->getDoctrine()->getManager();

            $swap = $em->getRepository(CarEntity::class)->createQueryBuilder('car_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $swapItems = $em->getRepository(DeviceEntity::class)->createQueryBuilder('device_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $usersProfiles = $em->getRepository(UserProfileEntity::class)->createQueryBuilder('profile')
                ->delete()
                ->getQuery()
                ->execute();

            $report = $em->getRepository(DocumentEntity::class)->createQueryBuilder('document_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $comments = $em->getRepository(ImageEntity::class)->createQueryBuilder('image_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $interactions = $em->getRepository(ReactionEntity::class)->createQueryBuilder('reaction_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $images = $em->getRepository(RealEstateEntity::class)->createQueryBuilder('real_estate_entity')
                ->delete()
                ->getQuery()
                ->execute();

            $users = $em->getRepository(UserEntity::class)->createQueryBuilder('user')
                ->delete()
                ->getQuery()
                ->execute();

            $setting = $em->getRepository(SettingEntity::class)->createQueryBuilder('setting')
                ->delete()
                ->getQuery()
                ->execute();

            $message = $em->getRepository(MessageEntity::class)->createQueryBuilder('message')
                ->delete()
                ->getQuery()
                ->execute();

            
        }
        catch (\Exception $ex)
        {
            return $this->json($ex);
        }

        return new Response("All Database information were being deleted");
    }

}