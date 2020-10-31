<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
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
     * @var array $user
     */
    private $user;

    /**
     * @var array $profile
     */
    private $profile;

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

    /**
     * @var array $realEstate
     */
    private $realEstate;

    /**
     * @var array $image
     */
    private $image;

    /**
     * @var array $reaction
     */
    private $reaction;

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
                'body'=>json_encode($this->car),
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Then A json response with the new car information
     */
    public function AJsonResponseWithTheNewCarInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['brand'] != "Test model")
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
                'body'=>json_encode($this->device),
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
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

        if($data['Data']['email'] != "behatAdmin5@test.com")
        {
            throw new Exception('Retrieved information does not match the new one!');
        }
    }

    /**
     * @Given /^I have valid new profile data$/
     */
    public function iHaveValidNewProfileData()
    {
        $factoryRequest = new RequestFactory();

        $this->profile = $factoryRequest->prepareCreateProfileRequestPayload();
    }

    /**
     * @When /^I request create a profile with the data I have$/
     */
    public function iRequestCreateAProfileWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$PROFILE_ENDPOINTS,
            [
                'body'=>json_encode($this->profile),
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Given /^A json response with the profile information$/
     */
    public function aJsonResponseWithTheProfileInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['userName'] != "behat7")
        {
            throw new Exception('Created data does not match the new one!');
        }
    }

    /**
     * @Given /^I have valid real\-estate data$/
     */
    public function iHaveValidRealEstateData()
    {
        $factoryRequest = new RequestFactory();

        $this->realEstate = $factoryRequest->prepareCreateRealEstateRequestPayload();
    }

    /**
     * @When /^I request create a new real\-estate with the data I have$/
     */
    public function iRequestCreateANewRealEstateWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$REAL_ESTATE_ENDPOINT,
            [
                'body'=>json_encode($this->realEstate),
                'headers'=>[
                    "Authorization" => "Bearer " . $this->token,
                    "Accept"        => "application/json",
                ]
            ]
        );
    }

    /**
     * @Given /^A json response with the new real\-estate information$/
     */
    public function aJsonResponseWithTheNewRealEstateInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['id'] == null)
        {
            throw new Exception('Created data does not match the new one!');
        }
    }

    /**
     * @Given I have valid new image data
     */
    public function iHaveValidNewImageData()
    {
        $factoryRequest = new RequestFactory();

        $this->image = $factoryRequest->prepareCreateImageRequestPayload();
    }

    /**
     * @When I request save a new image with the data I have
     */
    public function iRequestSaveANewImageWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$IMAGE_ENDPOINT,
            [
                "json"=>$this->image
            ]
        );
    }

    /**
     * @Then A json response with the new image information
     */
    public function aJsonResponseWithTheNewImageInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['image'] != "BehatImageTest")
        {
            throw new Exception('Created data does not match the new one!');
        }
    }

    /**
     * @Given I have valid reaction data
     */
    public function iHaveValidReactionData()
    {
        $factoryRequest = new RequestFactory();

        $this->reaction = $factoryRequest->prepareCreateReactionRequestPayload();
    }

    /**
     * @When I request create a new reaction with the data I have
     */
    public function iRequestCreateANewReactionWithTheDataIHave()
    {
        $this->response = $this->httpClient->post(
            ConfigLinks::$BASE_API . ConfigLinks::$REACTION_ENDPOINT,
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
     * @Then A json response with the new reaction information
     */
    public function aJsonResponseWithTheNewReactionInformation()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['itemID'] != "3")
        {
            throw new Exception('Created data does not match the new one!');
        }
    }


    use CreateCommon;
}
