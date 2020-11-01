<?php

use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Response;

trait CreateCommon
{
    /**
     * @var Response $response
     */
    private $response;

    /**
     * @var string $token
     */
    protected $token;

    /**
     * @var array $userCredentials
     */
    private $userCredentials;

    /**
     * @var Client $httpClient
     */
    private $httpClient;

    /**
     * @Given I have access to backend
     */
    public function iHaveAccessToBackend()
    {
        $this->httpClient = new Client([
            'base_uri'=>ConfigLinks::$BASE_API
        ]);
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
        }
    }

    /**
     * @Given I am signed in user
     */
    public function iAmSignedInUser()
    {
        $this->iHaveAccessToBackend();
        $this->iHaveValidUserCredentials();
        $this->iRequestLoginCheck();
        $this->iExpectATokenWithinTheResponse();
    }

    /**
     * @Then I expect response code :arg1
     */
    public function iExpectResponseCode($arg1)
    {
        if ($this->response->getStatusCode() == $arg1)
            return;
        else {
            return new Exception("Status Code Error", -1);
        }
    }
}