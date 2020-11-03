<?php


class RequestFactory
{
    public function prepareCreateCarRequestPayload()
    {
        $carMapper = new MapperCar();

        $carMapper->setCar(
            "Test model",
            "Test company",
            "Test engine",
            "3000",
            "updated test description",
            "Test status",
            "ab12",
            "22112 km",
            "test gear",
            "test cc",
            "test fuel",
            "test location",
            "image333"
        );

        return $carMapper->getCarAsArray();
    }

    public function prepareCarUpdateRequestPayload($id)
    {
        return [
            "id" => $id,
            "brand" => "updated Test model",
            "company" => "updated Test company",
            "engine" => "updated Test engine",
            "price" => "3000",
            "description" => "updated Test description",
            "status" => "updated Test status",
            "distance" => "ab12",
            "carType" => "22112 km",
            "gearType" => "updated test gear",
            "cc" => "test cc",
            "fuel" => "test fuel",
            "location" => "test location",
            "image" => "image333"
        ];
    }

    public function prepareCreateDeviceRequestPayload()
    {
        $deviceMapper = new MapperDevice();

        $deviceMapper->setDevice(
            "Test model",
            "Test cpu",
            "Test ram",
            "3000",
            "Test description",
            "Test status",
            "cd34",
            "22112 A",
            "istanbul, turkey",
            "123 days",
            "testImage"
        );

        return $deviceMapper->getDeviceAsArray();
    }

    public function prepareDeviceUpdateRequestPayload($id)
    {
        return [
            "id" => $id,
            "brand" => "updated Test model",
            "cpu" => "updated Test company",
            "ram" => "updated Test engine",
            "price" => "3000",
            "description" => "updated Test description",
            "status" => "updated Test status",
            "carType" => "22112 km",
            "battery" => "updated test gear",
            "gauge" => "test cc",
            "durationOfUse" => "test fuel",
            "location" => "test location",
            "image" => "image333"
        ];
    }

    public function prepareCreateRealEstateRequestPayload()
    {
        $realEstateMapper = new MapperRealEstate();

        $realEstateMapper->setRealEstate(
            "test city",
            "60 sm",
            "000",
            "test des",
            "test",
            "test",
            "test",
            "3-floor appartement",
            "super test",
            "test",
            "test"
        );

        return $realEstateMapper->getRealEstateAsArray();
    }

    public function prepareRealEstateUpdateRequestPayload($id)
    {
        return [
            "id" => $id,
            "city" => "updated city2",
            "space" => "updated space2",
            "price" => "3000 E",
            "description" => "updated test description2",
            "status" => "updated test status2",
            "state" => "Istanbul2",
            "numberOfFloors" => "3rd floor apartment2",
            "cladding" => "super deluxe2",
            "homeFurnishing" => "unfurnished",
            "realEstateType" => "apartment",
            "image" => "image333"
        ];
    }

    public function prepareCreateUserRequestPayload()
    {
        $userMapper = new MapperUser();

        $userMapper->setUser("u500@test.com",
            ['user'],
            "000",
            "u500"
        );

        return $userMapper->getUserAsArray();
    }

    public function prepareUserLoginRequestPayload()
    {
        return [
            "username"=>"u0",
            "password"=>"000"
        ];
    }

    public function prepareCreateProfileRequestPayload()
    {
        $profileMapper = new MapperProfile();

        $profileMapper->setProfile(
            "u500",
            "u500",
            "istanbul, turkey",
            "behat test",
            "behatImage"
        );

        return $profileMapper->getProfileAsArray();
    }

    public function prepareUserProfileUpdateRequestPayload()
    {
        return [
            "userName" => "u500",
            "location" => "updated location",
            "story" => "updated story",
            "image" => "updatedImage"
        ];
    }

    public function prepareCreateAdminRequestPayload()
    {
        $adminMapper = new MapperAdmin();

        $adminMapper->setAdmin("behatAdmin10@test.com",
            ['user'],
            "000",
            "behatAdmin10"
        );

        return $adminMapper->getAdminAsArray();
    }

    public function prepareCreateImageRequestPayload()
    {
        $imageMapper = new MapperImage();

        $imageMapper->setImage(
            "BehatImageTest",
            "car",
            "3"
        );

        return $imageMapper->getImageAsArray();
    }

    public function prepareRequestReactionsByEntityPayload($entity)
    {
        return ["entity"=>$entity];
    }

    public function prepareCreateStatusRequestPayload()
    {
        $statusMapper = new MapperStatus();

        $statusMapper->setStatus(
            "behat status test",
            "la12"
        );

        return $statusMapper->getStatusAsArray();
    }

    public function prepareStatusUpdateRequestPayload($id)
    {
        return [
            "id" => $id,
            "status" => "agreement updated",
            "lawyerID" => "la12"
        ];
    }

    public function prepareCreateReactionRequestPayload()
    {
        $reactionMapper = new MapperReaction();

        $reactionMapper->setReaction(
            "1",
            "Device",
            "10"
        );

        return $reactionMapper->getReactionAsArray();
    }
}