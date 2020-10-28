<?php

use GuzzleHttp\Client;

trait CreateCommon
{
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