<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\StatusEntity;
use App\Manager\StatusManager;
use App\Request\StatusCreateRequest;
use App\Request\StatusUpdateRequest;
use App\Response\GetAgreementsResponse;
use App\Response\StatusCreateResponse;
use App\Response\StatusUpdateResponse;
use App\Service\StatusService;
use App\Tests\fixtures\StatusProvider;
use PHPUnit\Framework\TestCase;

class StatusServiceUnitTest extends TestCase
{

    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(StatusManager::class);
        $this->autoMapping = new AutoMapping();
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new StatusCreateResponse();
        $response->userID = $expected;
        $response->LawyerID = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;

        $entity = new StatusEntity();
        $entity->setUserID($actual);
        $entity->setLawyerID($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);

        $request = new StatusCreateRequest();

        $this->mockManager
            ->method('statusCreate')
            ->willReturn($entity);

        $service = new StatusService($this->autoMapping, $this->mockManager);
        $this->assertEquals($response, $service->statusCreate($request));

    }

    public function create()
    {
        $result = new StatusProvider();
        return $result->create();
    }

    /**
     * @dataProvider update
     */
    public function testUpdateWithDataProvider($expected, $actual)
    {
        $response = new StatusUpdateResponse();
        $response->userID = $expected;
        $response->LawyerID = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;
        $response->createdAt = $expected;
        
        $entity = new StatusEntity();
        $entity->setUserID($actual);
        $entity->setLawyerID($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);
        $entity->setCreatedAt($actual);

        $request = new StatusUpdateRequest();

        $this->mockManager
            ->method('statusupdate')
            ->willReturn($entity);

        $service = new StatusService($this->autoMapping, $this->mockManager);
        $this->assertEquals($response, $service->statusupdate($request));
    }

    public function update()
    {
        $result = new StatusProvider();
        return $result->update();
    }

    /**
     * @dataProvider getAgreements
     */
    public function testGetAgreementsByUserIdWithDataProvider($expected, $actual)
    {
        $response = new GetAgreementsResponse();
        $response->userID = $expected;
        $response->LawyerID = $expected;
        $response->status = $expected;
        $response->createdBy = $expected;

        $entity = new StatusEntity();
        $entity->setUserID($actual);
        $entity->setLawyerID($actual);
        $entity->setStatus($actual);
        $entity->setCreatedBy($actual);

        $this->mockManager
            ->method('getAgreements')
            ->willReturn($entity);

        $service = new StatusService($this->autoMapping, $this->mockManager);

        $this->assertEquals($response, $service->getAgreements($actual));

    }

    public function getAgreements()
    {
        $result = new StatusProvider();
        return $result->getAgreements();
    }

}
