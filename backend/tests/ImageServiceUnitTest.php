<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\ImageEntity;
use App\Manager\ImageManager;
use App\Service\ImageService;
use App\Request\ImageCreateRequest;
use App\Response\ImageResponse;
use App\Response\ImageCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Tests\fixtures\ImageProvider;
use PHPUnit\Framework\TestCase;

class ImageServiceUnitTest extends TestCase
{
    private $mockManager;
    private $autoMapping;

    protected function setUp()
    {
        $this->mockManager = $this->createMock(ImageManager::class);
        $this->autoMapping = new AutoMapping();
        $this->params = $this->createMock(ParameterBagInterface::class);
    }

    /**
     * @dataProvider create
     */
    public function testCreateWithDataProvider($expected, $actual)
    {
        $response = new ImageResponse();
        $response->image = $expected;

        $entity = new ImageEntity();
        $entity->setImage($actual);
        $entity->setItemID($actual);
        $entity->setSpecialLink($actual);
        $entity->setEntity($actual);

        $request = new ImageCreateRequest();

        $this->mockManager
            ->method('imageCreate')
            ->willReturn($entity);

        $service = new ImageService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertIsObject($service->imageCreate($request));
       
    }

    public function create()
    {
        $result = new ImageProvider();
        return $result->create();
    }

    /**
     * @dataProvider getImages
     */
    public function testGetImagesWithDataProvider($expected, $actual)
    {
        $response = new ImageResponse();
        $response->image = $expected;

        $entity = new ImageEntity();
        $entity->setImage($actual);
        $entity->setItemID($actual);
        $entity->setEntity($actual);

        $this->mockManager
            ->method('getImages')
            ->willReturn($entity);

        $service = new ImageService($this->autoMapping, $this->mockManager, $this->params);

        $this->assertIsArray($service->getImages(5));
       
    }

    public function getImages()
    {
        $result = new ImageProvider();
        return $result->getImages();
    }


}