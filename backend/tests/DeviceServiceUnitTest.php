<?php
namespace App\Tests;


use App\AutoMapping;
use App\Entity\DeviceEntity;
use App\Service\DeviceService;
use App\Manager\DeviceManager;
use App\Request\DeviceCreateRequest;
use App\Request\DeviceUpdateRequest;
use App\Request\DeleteRequest;
use App\Request\GetByIdRequest;
use App\Response\DeviceCreateResponse;
use App\Response\DeviceGetByIdResponse;
use App\Response\DeviceGetResponse;
use App\Response\DevicesGetFilterResponse;
use App\Response\DeviceUpdateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

use App\Tests\fixtures\DeviceProvider;
use PHPUnit\Framework\TestCase;

class DeviceServiceUnitTest extends TestCase
{

    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(DeviceManager::class);
        $this->autoMapping = new AutoMapping();
        $this->params = $this->createMock(ParameterBagInterface::class);
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new DeviceCreateResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        
        $request = new DeviceCreateRequest();

        $this->mockManager
            ->method('create')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->create($request));

    }

    public function create()
    {
        $result = new DeviceProvider();
        return $result->create();
    }

    /**
     * @dataProvider getDeviceById
     */
    public function testGetDeviceByIdWithDataProvider($expected, $actual)
    {
        $response = new DeviceGetByIdResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        
        $request = new GetByIdRequest($actual);
        $this->mockManager
            ->method('getDeviceById')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response,$service->getDeviceById($request));
    }

    public function getDeviceById()
    {
        $result = new DeviceProvider();
        return $result->getDeviceById();
    }

    /**
     * @dataProvider getDevicesOfUser
     */
    public function testGetDevicesOfUserWithDataProvider($expected, $actual)
    {
        $response = new DeviceGetResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        

        $this->mockManager
            ->method('getDevicesOfUser')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertIsArray($service->getDevicesOfUser('5'));
    }

    public function getDevicesOfUser()
    {
        $result = new DeviceProvider();
        return $result->getDevicesOfUser();
    }

     /**
     * @dataProvider getAllDevices
     */
    public function testGetAllDevicesWithDataProvider($expected, $actual)
    {
        $response = new DeviceGetResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        
        $this->mockManager
            ->method('getAllDevices')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertIsArray($service->getAllDevices());
    }

    public function getAllDevices()
    {
        $result = new DeviceProvider();
        return $result->getAllDevices();
    }

    /**
     * @dataProvider update
     */
    public function testupdateWithDataProvider($expected, $actual)
    {
        $response = new DeviceUpdateResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        
        $request = new DeviceUpdateRequest();

        $this->mockManager
            ->method('update')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->update($request));

    }

    public function update()
    {
        $result = new DeviceProvider();
        return $result->update();
    }

      /**
     * @dataProvider delete
     */
    public function testDeleteWithDataProvider($expected, $actual)
    {
        $response = new DeviceGetByIdResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);
        
        $request = new DeleteRequest($entity->getId());

        $this->mockManager
            ->method('delete')
            ->willReturn($entity);

      
        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
        $this->assertEquals($response, $service->delete($request));
    }

    public function delete()
    {
        $result = new DeviceProvider();
        return $result->delete();
    }

    /**
     * @dataProvider getFilter
     */
    public function testGetFiltercarByUserByIdWithDataProvider($expected, $actual)
    {
        $response = new DevicesGetFilterResponse();
        $response->brand = $expected;
        $response->cpu = $expected;
        $response->ram = $expected;
        $response->battery = $expected;
        $response->price = $expected;
        // $response->yearOfRelease = $expected;
        $response->description = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        // $response->createdAt = $expected;
        $response->gauge = $expected;
        $response->location = $expected;
        $response->durationOfUse = $expected;
        $response->image = $expected;

        $entity = new DeviceEntity();
        $entity->setModel($actual);
        $entity->setCpu($actual);
        $entity->setRam($actual);
        $entity->setBattery($actual);
        $entity->setPrice($actual);
        // $entity->setProductionYear();
        $entity->setDescription($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        // $entity->setCreatedAt($actual);
        $entity->setGauge($actual);
        $entity->setLocation($actual);
        $entity->setImage($actual);
        $entity->setDurationOfUse($actual);

        $this->mockManager
            ->method('getFilter')
            ->willReturn($entity);

        $service = new DeviceService($this->autoMapping, $this->mockManager, $this->params);
       
        $this->assertIsArray($service->getFilter('price', $actual));
        
    }

    public function getFilter()
    {
        $result = new DeviceProvider();
        return $result->getFilter();
    }
}
