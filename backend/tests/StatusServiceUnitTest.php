<?php
namespace App\Tests;

use App\AutoMapping;
use App\Entity\StatusEntity;
use App\Manager\StatusManager;
use App\Request\StatusCreateRequest;
use App\Request\StatusUpdateRequest;
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
    public function testCreateWithDataProvider($expected,$actual)
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

        $Request = new StatusCreateRequest();

        $this->mockManager
            ->method('create')
            ->willReturn($entity);

        $service = new StatusService($this->mockManager, $this->autoMapping);
        $this->assertEquals($response, $service->statusCreate($createRatingRequest));

    }

    public function create()
    {
        $result = new RatingProvider();
        return $result->create();
    }

    /**
     * @dataProvider update
     */
    public function testUpdateWithDataProvider($expected, $actual)
    {
        $updateRatingResponse = new UpdateRatingResponse();
        $updateRatingResponse->rateValue = $expected;
        $updateRatingResponse->animeID = $expected;
        $updateRatingResponse->userID = $expected;

        $rating = new Rating();
        $rating->setRateValue($actual);
        $rating->setAnimeID($actual);
        $rating->setUserID($actual);

        $UpdateRatingRequest = new UpdateRatingRequest();

        $this->mockRatingManager
            ->method('update')
            ->willReturn($rating);

        $ratingService = new RatingService($this->mockRatingManager, $this->autoMapping, $this->gradeService, $this->updateGradeRequest);

        $this->assertEquals($updateRatingResponse, $ratingService->update($UpdateRatingRequest));
    }

    public function update()
    {
        $result = new RatingProvider();
        return $result->update();
    }

     /**
     * @dataProvider getAllRatings
     */
    public function testGetAllRatingsByAnimeIdWithDataProvider( $expected,  $actual)
    {       
        $Response = new CountRatingResponse();
        $Response->setAvgRating($expected);
        
        $this->mockRatingManager
            ->method('getAllRatings')
            ->willReturn(["avgRating" => $actual]);

        $ratingService = new RatingService($this->mockRatingManager, $this->autoMapping, $this->gradeService, $this->updateGradeRequest);
        
        $this->assertEquals($Response, $ratingService->getAllRatings($actual));
        
    }

    public function getAllRatings()
    {
        $result = new RatingProvider();
        return $result->getAllRatingsByAnimeID();
    }

}