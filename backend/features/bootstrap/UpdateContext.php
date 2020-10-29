<?php


use Behat\Behat\Context\Context;

class UpdateContext implements Context
{
    /**
     * @var array $car
     */
    private $car;

    public function __construct()
    {
    }

    use CreateCommon;

    /**
     * @Given /^I have a valid car update request of ID "([^"]*)"$/
     */
    public function iHaveAValidCarUpdateRequestOfID($arg1)
    {
        $requestFactory = new RequestFactory();

        $this->car = $requestFactory->prepareCarUpdateRequestPayload($arg1);
    }

    /**
     * @When I request update a car
     */
    public function iRequestUpdateACar()
    {
        $this->response = $this->httpClient->put(
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
     * @Then I expect the response update successfully
     */
    public function iExpectTheResponseUpdateSuccessfully()
    {
    }

    /**
     * @Then I expect the updated car match the data
     */
    public function iExpectTheUpdatedCarMatchTheData()
    {
        $data = json_decode($this->response->getBody(), true);

        if($data['Data']['brand'] != 'Test model')
        {
            throw new Exception('Wrong data were being updated!');
        }
    }
}