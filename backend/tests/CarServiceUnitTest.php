<?php
namespace App\Tests;


use App\AutoMapping;
use App\Entity\CarEntity;
use App\Manager\CarManager;
use App\Request\CarCreateRequest;
use App\Request\GetByIdRequest;
use App\Request\CarUpdateRequest;
use App\Request\DeleteRequest;
use App\Response\CarCreateResponse;
use App\Response\CarGetByIdResponse;
use App\Response\CarGetResponse;
use App\Response\CarGetFilterResponse;
use App\Response\CarUpdateResponse;
use App\Service\CarService;

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Tests\fixtures\CarProvider;
use PHPUnit\Framework\TestCase;

class CarServiceUnitTest extends TestCase
{

    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(CarManager::class);
        $this->autoMapping = new AutoMapping();
        $this->params = $this->createMock(ParameterBagInterface::class);
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new CarCreateResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        
        $request = new CarCreateRequest();

        $this->mockManager
            ->method('create')
            ->willReturn($entity);

        $service = new CarService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertEquals($response, $service->create($request));

    }

    public function create()
    {
        $result = new CarProvider();
        return $result->create();
    }

    /**
     * @dataProvider getCarById
     */
    public function testGetCarByIdWithDataProvider($expected, $actual)
    {
        $response = new CarGetByIdResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        
        $request = new GetByIdRequest($actual);
        $this->mockManager
            ->method('getCarById')
            ->willReturn($entity);

       $service = new CarService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertEquals($response,$service->getCarById($request));
    }

    public function getCarById()
    {
        $result = new CarProvider();
        return $result->getCarById();
    }

    /**
     * @dataProvider getCarsOfUser
     */
    public function testGetCarsOfUserWithDataProvider($expected, $actual)
    {
        $response = new CarGetResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        
        $request = new GetByIdRequest($actual);
        $this->mockManager
            ->method('getCarsOfUser')
            ->willReturn($entity);

        $service = new CarService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertIsArray($service->getCarsOfUser($actual));
    }

    public function getCarsOfUser()
    {
        $result = new CarProvider();
        return $result->getCarsOfUser();
    }

    /**
     * @dataProvider getAllCars
     */
    public function testGetAllCarsWithDataProvider($expected, $actual)
    {
        $response = new CarGetResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        
        $this->mockManager
            ->method('getAllCars')
            ->willReturn($entity);

        $service = new CarService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertIsArray($service->getAllCars($actual));
    }

    public function getAllCars()
    {
        $result = new CarProvider();
        return $result->getAllCars();
    }

     /**
     * @dataProvider update
     */
    public function testUpdateWithDataProvider($expected, $actual)
    {
        $response = new CarUpdateResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        
        $request = new CarUpdateRequest();

        $this->mockManager
            ->method('update')
            ->willReturn($entity);

        $service = new CarService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertEquals($response, $service->update($request));

    }

    public function update()
    {
        $result = new CarProvider();
        return $result->update();
    }

    
    /**
     * @dataProvider delete
     */
    public function testDeleteWithDataProvider($expected, $actual)
    {
        $response = new CarGetByIdResponse();
        $response->brand = $expected;
        $response->company = $expected;
        // $response->yearOfRelease = $expected;
        $response->engine = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->distance = $expected;
        $response->carType = $expected;
        $response->gearType = $expected;
        $response->cc = $expected;
        $response->fuel = $expected;
        $response->location = $expected;
        $response->image = $expected;

        $entity = new CarEntity();
        $entity->setModel($actual);
        $entity->setCompany($actual);
        // $entity->setProductionYear();
        $entity->setEngine($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setDistance($actual);
        $entity->setCarType($actual);
        $entity->setGearType($actual);
        $entity->setCc($actual);
        $entity->setFuel($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);

          
        $request = new DeleteRequest($entity->getId());

        $this->mockManager
            ->method('delete')
            ->willReturn($entity);

      
        $service = new CarService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->delete($request));
    }

    public function delete()
    {
        $result = new CarProvider();
        return $result->delete();
    }
}
