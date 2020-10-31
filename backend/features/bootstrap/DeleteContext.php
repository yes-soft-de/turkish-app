<?php


use Behat\Behat\Context\Context;
use GuzzleHttp\Client;

class DeleteContext implements Context
{
    public function __construct()
    {
    }

    /**
     * @When /^I request delete a car of ID "([^"]*)"$/
     */
    public function iRequestDeleteACarOfID($arg1)
    {
        $this->response = $this->httpClient->delete(
            ConfigLinks::$BASE_API . ConfigLinks::$CAR_ENDPOINTS . '/' . $arg1
        );
    }

    /**
     * @When /^I request delete a device of ID "([^"]*)"$/
     */
    public function iRequestDeleteADeviceOfID($arg1)
    {
        $this->response = $this->httpClient->delete(
            ConfigLinks::$BASE_API . ConfigLinks::$DEVICE_ENDPOINTS . '/' . $arg1
        );
    }

    /**
     * @Given /^I expect message of delete successfully$/
     */
    public function iExpectMessageOfDeleteSuccessfully()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['msg'] != "deleted Successfully.")
        {
            throw new Exception('Error in confirming delete defined data successfully!');
        }
    }

    /**
     * @When /^I request delete a realEstate of ID "([^"]*)"$/
     */
    public function iRequestDeleteARealEstateOfID($arg1)
    {
        $this->response = $this->httpClient->delete(
            ConfigLinks::$BASE_API . ConfigLinks::$REAL_ESTATE_ENDPOINT . '/' . $arg1
        );
    }

    use CreateCommon;
}