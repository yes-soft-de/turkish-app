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
     * QueryContext constructor.
     */
    public function __construct()
    {
    }

    /**
     * @When /^I request a car by ID "([^"]*)"$/
     */
    public function iRequestACarByID($arg1)
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . 'car/' . $arg1
        );
    }

    /**
     * @Given /^A json response with the requested cars information$/
     */
    public function aJsonResponseWithTheRequestedCarsInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('No data for the provided identifier!');
        }
    }

    /**
     * @Given /^A json response with the car information$/
     */
    public function aJsonResponseWithTheCarInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['brand'] != 'Toyota')
        {
            throw new Exception('Returned data does not match the required!');
        }
    }

    /**
     * @When /^I request the cars of valid user$/
     */
    public function iRequestTheCarsOfValidUser()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$CAR_ENDPOINTS,
            [
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    use CreateCommon;
}