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

    /**
     * @var array $user
     */
    private $user;

    /**
     * @var array $userCredentials
     */
    private $userCredentials;

    /**
     * @var array $admin
     */
    private $admin;

    /**
     * @var array $car
     */
    private $car;

    /**
     * @var array $device
     */
    private $device;

    static protected $token;

    public function __construct()
    {
    }

    /**
     * @Given I have valid car data
     */
    public function iHaveValidCarData()
    {
        $factoryRequest = new RequestFactory();

        $this->car = $factoryRequest->prepareCreateCarRequestPayload();
    }

    /**
     * @When I request create a new car with the data I have
     */
    public function iRequestCreateANewCarWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$CAR_ENDPOINTS,
            [
                "json"=>$this->car
            ]
        );
    }

    /**
     * @Then A json response with the new car information
     */
    public function AJsonResponseWithTheNewCarInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['model'] != "Test model")
        {
            throw new Exception('The returned data does not match the new one!');
        }
    }

    /**
     * @Given I have valid device data
     */
    public function iHaveValidDeviceData()
    {
        $factoryRequest = new RequestFactory();

        $this->device = $factoryRequest->prepareCreateDeviceRequestPayload();
    }

    /**
     * @When I request create a new device with the data I have
     */
    public function iRequestCreateANewDeviceWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$DEVICE_ENDPOINTS,
            [
                "json"=>$this->device
            ]
        );
    }

    /**
     * @Then A json response with the new device information
     */
    public function aJsonResponseWithTheNewDeviceInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['cpu'] != "Test cpu")
        {
            throw new Exception('The returned data does not match the new one!');
        }
    }

    /**
     * @Given I have valid new user data
     */
    public function iHaveValidNewUserData()
    {
        $factoryRequest = new RequestFactory();

        $this->user = $factoryRequest->prepareCreateUserRequestPayload();
    }

    /**
     * @When I request create a new user with the data I have
     */
    public function iRequestCreateANewUserWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$USER_ENDPOINT,
            [
                "json"=>$this->user
            ]
        );
    }

    /**
     * @Given /^A json response with the new user information$/
     */
    public function aJsonResponseWithTheNewUserInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['roles'] == null)
        {
            throw new Exception('Error in register a new user!');
        }
    }

    /**
     * @Given I have valid user credentials
     */
    public function iHaveValidUserCredentials()
    {
        $factoryRequest = new RequestFactory();

        $this->userCredentials = $factoryRequest->prepareUserLoginRequestPayload();
    }

    /**
     * @When I request login check
     */
    public function iRequestLoginCheck()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . 'login_check',
            [
                "json"=>$this->userCredentials
            ]
        );
    }

    /**
     * @Then I expect a token within the response
     */
    public function iExpectATokenWithinTheResponse()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['token'] == null)
        {
            throw new Exception('Error in retrieving the token!');
        }
        else
        {
            $this->token = $data['token'];
            echo $this->token;
        }
    }

    /**
     * @Given I have valid new admin data
     */
    public function iHaveValidNewAdminData()
    {
        $factoryRequest = new RequestFactory();

        $this->admin = $factoryRequest->prepareCreateAdminRequestPayload();
    }

    /**
     * @When I request create a new admin with the data I have
     */
    public function iRequestCreateANewAdminWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . 'createnimda',
            [
                "json"=>$this->admin
            ]
        );
    }

    /**
     * @Then A json response with the new admin information
     */
    public function aJsonResponseWithTheNewAdminInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['email'] != "behatAdmin1@test.com")
        {
            throw new Exception('Retrieved information does not match the new one!');
        }
    }

    /**
     * @When /^I request my profile$/
     */
    public function iRequestMyProfile()
    {
        $headers = [
            "Authorization" => "Bearer " . $this->token,
            "Accept"        => "application/json",
        ];

        $this->response = $this->httpClient->get(
            ConfigLinks::$BASE_API . 'userprofile',
            [
                'headers' => $headers
            ]
        );
    }

    /**
     * @Given /^A json response with my information$/
     */
    public function aJsonResponseWithMyInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['username'] != "Test model")
        {
            throw new Exception('Wrong returned data !');
        }
    }


    use CreateCommon;
}
