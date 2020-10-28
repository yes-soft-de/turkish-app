<?php


use Behat\Behat\Context\Context;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Response;

class QueryContext implements Context
{
//    /**
//     * @var Client $httpClient
//     */
//    private $httpClient;

    /**
     * @var Response $response
     */
    private $response;

    /**
     * QueryContext constructor.
     */
    public function __construct()
    {
    }

    /**
     * @When /^I request get car by valid created by$/
     */
    public function iRequestGetCarByValidCreatedBy()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$CAR_ENDPOINTS . 'behat1'
        );
    }

    /**
     * @Given /^A json response with the requested car information$/
     */
    public function aJsonResponseWithTheRequestedCarInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('No data for the provided identifier!');
        }
    }

    /**
     * @When /^I request a car by ID "([^"]*)"$/
     */
    public function iRequestACarByID($arg1)
    {
    }

    /**
     * @Given /^A json response with the car information$/
     */
    public function aJsonResponseWithTheCarInformation()
    {
    }

    use CreateCommon;
}