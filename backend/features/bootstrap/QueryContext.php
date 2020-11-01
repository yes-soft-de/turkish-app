<?php


use Behat\Behat\Context\Context;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Response;

class QueryContext implements Context
{
    /**
     * @var array $reaction
     */
    private $reaction;

    public function __construct()
    {
    }

    /**
     * @When /^I request my profile$/
     */
    public function iRequestMyProfile()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . 'userprofile',
            [
                'headers' => [
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Given /^A json response with my information$/
     */
    public function aJsonResponseWithMyInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['userName'] != "behat1")
        {
            throw new Exception('Wrong returned data !');
        }
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

    /**
     * @When /^I request the devices of valid user$/
     */
    public function iRequestTheDevicesOfValidUser()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$DEVICE_ENDPOINTS,
            [
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Given /^A json response with the requested devices information$/
     */
    public function aJsonResponseWithTheRequestedDevicesInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('No data for the provided identifier!');
        }
    }

    /**
     * @When /^I request a device by ID "([^"]*)"$/
     */
    public function iRequestADeviceByID($arg1)
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . 'device/' . $arg1
        );
    }

    /**
     * @Given /^A json response with the device information$/
     */
    public function aJsonResponseWithTheDeviceInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['brand'] != 'Test model')
        {
            throw new Exception('Returned data does not match the required!');
        }
    }

    /**
     * @When /^I request all cars$/
     */
    public function iRequestAllCars()
    {
        $this->response = $this->httpClient->get(ConfigLinks::$BASE_API . 'all-cars');
    }

    /**
     * @Given /^A list of all available cars$/
     */
    public function aListOfAllAvailableCars()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('Error: null were being returned!');
        }
    }

    /**
     * @When /^I request all devices$/
     */
    public function iRequestAllDevices()
    {
        $this->response = $this->httpClient->get(ConfigLinks::$BASE_API . 'all-devices');
    }

    /**
     * @Given /^A list of all available devices$/
     */
    public function aListOfAllAvailableDevices()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('Error: null were being returned!');
        }
    }

    /**
     * @When /^I request all real estates$/
     */
    public function iRequestAllRealEstates()
    {
        $this->response = $this->httpClient->get(ConfigLinks::$BASE_API . 'all-real-estate');
    }

    /**
     * @Given /^A list of all available real estates$/
     */
    public function aListOfAllAvailableRealEstates()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('Error: null were being returned!');
        }
    }

    /**
     * @When /^I request the real estates of valid user$/
     */
    public function iRequestTheRealEstatesOfValidUser()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . 'real-estates',
            [
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Given /^A json response with the requested real estates information$/
     */
    public function aJsonResponseWithTheRequestedRealEstatesInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('No data for the provided identifier!');
        }
    }

    /**
     * @When /^I request a real estate by ID "([^"]*)"$/
     */
    public function iRequestARealEstateByID($arg1)
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$REAL_ESTATE_ENDPOINT . '/' . $arg1
        );
    }

    /**
     * @Given /^A json response with the real estate information$/
     */
    public function aJsonResponseWithTheRealEstateInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['realEstateType'] != 'apartment')
        {
            throw new Exception('Returned data does not match the required!');
        }
    }

    /**
     * @Given I have the entity value :arg1
     */
    public function iHaveTheEntityValue($arg1)
    {
        $requestFactory = new RequestFactory();

        $this->reaction = $requestFactory->prepareRequestReactionsByEntityPayload($arg1);
    }

    /**
     * @When I request the reactions of an item with Id :arg1
     */
    public function iRequestTheReactionsOfAnItemWithId($arg1)
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$REACTION_ENDPOINT . '/' . $arg1,
            [
                'body'=>json_encode($this->reaction),
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }


    /**
     * @Then I expect a response with list of all required reactions
     */
    public function iExpectAResponseWithListOfAllRequiredReactions()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data'][0] == null)
        {
            throw new Exception('Returned data does not match the required!');
        }
    }

    /**
     * @When /^I request all my interactions$/
     */
    public function iRequestAllMyInteractions()
    {
        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . ConfigLinks::$REACTION_ENDPOINT,
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