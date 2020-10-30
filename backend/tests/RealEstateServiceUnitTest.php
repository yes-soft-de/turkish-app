<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\RealEstateEntity;
use App\Manager\RealEstateManager;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Request\RealEstateCreateRequest;
use App\Request\RealEstateUpdateRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Response\RealEstateGetAllResponse;
use App\Response\RealEstateGetByIdResponse;
use App\Response\RealEstateCreateResponse;
use App\Response\RealEstateUpdateResponse;
use App\Response\RealEstateGetFilterResponse;
use App\Service\RealEstateService;
use App\Tests\fixtures\RealEstateProvider;
use PHPUnit\Framework\TestCase;

class RealEstateServiceUnitTest extends TestCase
{

    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(RealEstateManager::class);
        $this->autoMapping = new AutoMapping();
        $this->params = $this->createMock(ParameterBagInterface::class);
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new RealEstateCreateResponse();
        $response->city = $expected;
        $response->space = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->state = $expected;
        $response->createdAt = $expected;

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);
        
        $entity->setCreatedAt($actual);

        $request = new RealEstateCreateRequest();

        $this->mockManager
            ->method('realEstateCreate')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->realEstateCreate($request));

    }

    public function create()
    {
        $result = new RealEstateProvider();
        return $result->create();
    }

    /**
     * @dataProvider getRealEstateById
     */
    public function testGetRealEstateByIdWithDataProvider($expected, $actual)
    {
        $response = new RealEstateGetByIdResponse();
        $response->city = $expected;
        $response->space = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->state = $expected;

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $getByIdRequest = new GetByIdRequest($actual);

        $this->mockManager
            ->method('getRealEstateById')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->getRealEstateById($getByIdRequest));
    }

    public function getRealEstateById()
    {
        $result = new RealEstateProvider();
        return $result->getRealEstateById();
    }

    /**
     * @dataProvider getAllRealEstate
     */
    public function testGetAllRealEstateByIdWithDataProvider($expected, $actual)
    {
        $response = new RealEstateGetAllResponse();
        $response->city = $expected;
        $response->space = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->state = $expected;

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $this->mockManager
            ->method('getAllRealEstate')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertIsArray($service->getAllRealEstate());
        
    }

    public function getAllRealEstate()
    {
        $result = new RealEstateProvider();
        return $result->getAllRealEstate();
    }

    /**
     * @dataProvider getRealEstateByUser
     */
    public function testGetAllRealEstateByUserByIdWithDataProvider($expected, $actual)
    {
        $response = new RealEstateGetAllResponse();
        $response->createdBy = $expected;
        

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $this->mockManager
            ->method('getRealEstateByUser')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertIsArray($service->getRealEstateByUser($response->createdBy));
        
    }

    public function getRealEstateByUser()
    {
        $result = new RealEstateProvider();
        return $result->getRealEstateByUser();
    }

    /**
     * @dataProvider update
     */
    public function testUpdateWithDataProvider($expected, $actual)
    {
        $response = new RealEstateUpdateResponse();
        $response->city = $expected;
        $response->space = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->state = $expected;

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $request = new RealEstateUpdateRequest();

        $this->mockManager
            ->method('realEstateUpdate')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->realEstateUpdate($request));
    }

    public function update()
    {
        $result = new RealEstateProvider();
        return $result->update();
    }

    /**
     * @dataProvider delete
     */
    public function testDeleteWithDataProvider($expected, $actual)
    {
        $response = new RealEstateGetByIdResponse();
        $response->id = $expected;
        $response->city = $expected;
        $response->space = $expected;
        $response->price = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->state = $expected;

        $entity = new RealEstateEntity();
        $entity->setId($actual);
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $request = new DeleteRequest($entity->getId());

        $this->mockManager
            ->method('delete')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->delete($request));
    }

    public function delete()
    {
        $result = new RealEstateProvider();
        return $result->delete();
    }

    /**
     * @dataProvider getFilter
     */
    public function testGetFilterRealEstateByUserByIdWithDataProvider($expected, $actual)
    {
        $response = new RealEstateGetFilterResponse();
        $response->city = $expected;

        $entity = new RealEstateEntity();
        $entity->setCity($actual);
        $entity->setSpace($actual);
        $entity->setPrice($actual);
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setState($actual);

        $this->mockManager
            ->method('getFilterCity')
            ->willReturn($entity);
        $this->mockManager
            ->method('getFilterSpace')
            ->willReturn($entity);
        $this->mockManager
            ->method('getFilterPrice')
            ->willReturn($entity);
        $this->mockManager
            ->method('getFilterNumberOfFloors')
            ->willReturn($entity);

        $service = new RealEstateService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertIsArray($service->getFilter('city', $actual));
        $this->assertIsArray($service->getFilter('space', $actual));
        $this->assertIsArray($service->getFilter('price', $actual));
        $this->assertIsArray($service->getFilter('numberOfFloors', $actual));
        
    }

    public function getFilter()
    {
        $result = new RealEstateProvider();
        return $result->getFilter();
    }
}
