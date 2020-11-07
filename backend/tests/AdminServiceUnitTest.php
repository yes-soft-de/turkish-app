<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Manager\AdminManager;
use App\Service\AdminService;
use App\Request\AdminCreateRequest;
use App\Response\AdminCreateResponse;
use App\Tests\fixtures\AdminProvider;
use PHPUnit\Framework\TestCase;

class AdminServiceUnitTest extends TestCase
{
    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(AdminManager::class);
        $this->autoMapping = new AutoMapping();
    }

    /**
     * @dataProvider adminCreate
     */
    public function testAdminCreateWithDataProvider($expected, $actual)
    {
        $response = new AdminCreateResponse();
        $response->email = $expected;

        $entity = new UserEntity($actual);
        $entity->setRoles(['admin']);
        $entity->setPassword($actual);
        $entity->setEmail($actual);
        $entity->setUserID($actual);

        $request = new AdminCreateRequest();

        $this->mockManager
            ->method('adminCreate')
            ->willReturn($entity);

        $service = new AdminService($this->autoMapping, $this->mockManager);

        $this->assertIsObject($service->adminCreate($request));

    }

    public function adminCreate()
    {
        $result = new AdminProvider();
        return $result->adminCreate();
    }

}