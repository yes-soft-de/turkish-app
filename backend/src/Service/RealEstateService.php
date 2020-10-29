<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\RealEstateEntity;
use App\Manager\RealEstateManager;
use App\Request\RealEstateCreateRequest;
use App\Response\GetAllRealEstateResponse;
use App\Response\GetRealEstateByIdResponse;
use App\Response\GetRealEstateFilterResponse;
use App\Response\RealEstateCreateResponse;
use App\Response\RealEstateUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class RealEstateService
{
    private $autoMapping;
    private $realEstateManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, RealEstateManager $realEstateManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->realEstateManager = $realEstateManager;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function realEstateCreate(RealEstateCreateRequest $request)
    {
        $create = $this->realEstateManager->RealEstateCreate($request);
        return $this->autoMapping->map(RealEstateEntity::class, RealEstateCreateResponse::class, $create);
    }

    public function getRealEstateById($request)
    {
        $result = $this->realEstateManager->getRealEstateById($request);

        $response = $this->autoMapping->map(RealEstateEntity::class, GetRealEstateByIdResponse::class, $result);

        return $response;
    }

    public function getAllRealEstate()
    {
        $response = [];
        $result = $this->realEstateManager->getAllRealEstate();

        foreach ($result as $row) {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $response[] = $this->autoMapping->map('array', GetAllRealEstateResponse::class, $row);
        }

        return $response;
    }

    public function getRealEstateByUser($userID)
    {
        $response = [];
        $result = $this->realEstateManager->getRealEstateByUser($userID);
        foreach ($result as $row) {
            $row['image'] = $this->specialLinkCheck($row['specialLink']) . $row['image'];

            $response[] = $this->autoMapping->map('array', GetAllRealEstateResponse::class, $row);
        }

        return $response;
    }

    public function realEstateUpdate($request)
    {
        $result = $this->realEstateManager->realEstateUpdate($request);

        return $this->autoMapping->map(RealEstateEntity::class, RealEstateUpdateResponse::class, $result);
    }

    public function delete($request)
    {
        $result = $this->realEstateManager->delete($request);

        return $this->autoMapping->map(RealEstateEntity::class, GetRealEstateByIdResponse::class, $result);
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool) {
            return $this->params;
        }
    }

    public function getFilter($key, $value)
    {
        $response = [];
        if ($key == 'city') {
            $item = $this->realEstateManager->getFilterCity($value);
        }
        if ($key == 'space') {
            $item = $this->realEstateManager->getFilterSpace($value);
        }
        if ($key == 'price') {
            $item = $this->realEstateManager->getFilterPrice($value);
        }
        if ($key == 'numberOfFloors') {
            $item = $this->realEstateManager->getFilterNumberOfFloors($value);
        }
        foreach ($item as $row) {
            $response[] = $this->autoMapping->map('array', GetRealEstateFilterResponse::class, $row);
        }
        return $response;
    }
}
