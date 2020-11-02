<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\ReactionEntity;
use App\Manager\ReactionManager;
use App\Request\ReactionCreateRequest;
use App\Request\RealEstateUpdateRequest;
use App\Request\GetByIdRequest;
use App\Response\ReactionGetResponse;
use App\Response\ReactionCreateResponse;
use App\Service\ReactionService;
use App\Tests\fixtures\ReactionProvider;
use PHPUnit\Framework\TestCase;

class ReactionServiceUnitTest extends TestCase
{

    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(ReactionManager::class);
        $this->autoMapping = new AutoMapping();
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new ReactionCreateResponse();
        $response->createdBy = $expected;
        $response->type = $expected;
        $response->createdAt = $expected;
        $response->itemID = $expected;
        $response->entity = $expected;

        $entity = new ReactionEntity();
        $entity->setCreatedBy($actual);
        $entity->setType($actual);
        $entity->setCreatedAt($actual);
        $entity->setItemID($actual);
        $entity->setEntity($actual);

        $request = new ReactionCreateRequest();

        $this->mockManager
            ->method('reactionCreate')
            ->willReturn($entity);

        $service = new ReactionService($this->mockManager ,$this->autoMapping);
        $this->assertEquals($response, $service->reactionCreate($request));

    }

    public function create()
    {
        $result = new ReactionProvider();
        return $result->create();
    }

    /**
     * @dataProvider getAll
     */
    public function testGetAllWithDataProvider($expected, $actual)
    {
        $response = new ReactionGetResponse();
        $response->createdBy = $expected;
        $response->type = $expected;
        $response->createdAt = $expected;
        $response->itemID = $expected;
        $response->entity = $expected;

        $entity = new ReactionEntity();
        $entity->setCreatedBy($actual);
        $entity->setType($actual);
        $entity->setItemID($actual);
        $entity->setEntity($actual);

        $request = new ReactionCreateRequest();

        $this->mockManager
            ->method('getAll')
            ->willReturn($entity);

        $service = new ReactionService($this->mockManager ,$this->autoMapping);
        $this->assertIsArray($service->getAll($request, $actual));
    }

    public function getAll()
    {
        $result = new ReactionProvider();
        return $result->getAll();
    }

    /**
     * @dataProvider getReactionsForUser
     */
    public function testGetReactionsForUserWithDataProvider($expected, $actual)
    {
        $response = new ReactionGetResponse();
        $response->createdBy = $expected;
        $response->type = $expected;
        $response->createdAt = $expected;
        $response->itemID = $expected;
        $response->entity = $expected;

        $entity = new ReactionEntity();
        $entity->setCreatedBy($actual);
        $entity->setType($actual);
        $entity->setItemID($actual);
        $entity->setEntity($actual);

        $this->mockManager
            ->method('getReactionsForUser')
            ->willReturn($entity);

        $service = new ReactionService($this->mockManager ,$this->autoMapping);
        $this->assertIsArray($service->getReactionsForUser( $actual));
    }

    public function getReactionsForUser()
    {
        $result = new ReactionProvider();
        return $result->getReactionsForUser();
    }

   
}
