<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Response;

/**
 * Defines application features from the specific context.
 */
class CreateContext implements Context
{
    /**
     * @var Client $httpClient
     */
    private $httpClient;

    /**
     * @var Response $response
     */
    private $response;

    private $car;

    public function __construct()
    {
    }

    /**
     * @Given I am signed in user
     */
    public function iAmSignedInUser()
    {
        $this->httpClient = new Client([
            'base_uri'=>ConfigLinks::$BASE_API
        ]);
    }

    /**
     * @Given I have valid car data
     */
    public function iHaveValidCarData()
    {
        $factoryRequest = new RequestFactory();

        $car = $factoryRequest->prepareCreateCarRequestPayload();
    }

    /**
     * @When I request create a new car with the data I have
     */
    public function iRequestCreateANewCarWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$CAR_ENDPOINTS,
            [
                'json'=>$this->car
            ]
        );
    }

    /**
     * @Then I expect response code :arg1
     */
    public function iExpectResponseCode($arg1)
    {
    }

    /**
     * @Then a json response with the new car information
     */
    public function aJsonResponseWithTheNewCarInformation()
    {
    }

}
