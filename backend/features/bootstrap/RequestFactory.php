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
            "brand" => "Test model",
            "company" => "Test company",
            "engine" => "Test engine",
            "price" => "3000",
            "description" => "Test description",
            "status" => "Test status",
            "distance" => "ab12",
            "carType" => "22112 km",
            "gearType" => "test gear",
            "cc" => "test cc",
            "fuel" => "test fuel",
            "location" => "test location",
            "image" => "image333"
        ];
    }

    public function prepareRequestWithCarId($id)
    {
        return [
            "car" => $id
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
//        return [
//            "id" => $id,
//            "articleTitle" => "Behat Update API Test",
//            "article" => "Behat Update API Test",
//            "idCategory" => "1"
//        ];
    }

    public function prepareRequestWithDeviceId($id)
    {
        return [
            "device" => $id
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

//    public function prepareCreateImagePayload($arg1)
//    {
//        $imageMapper = new MapperImage();
//
//        $imageMapper->setImage(
//            "BehatImageTest",$arg1
//        );
//
//        return $imageMapper->getImageAsArray();
//    }

//    public function prepareImageUpdatePayload($id)
//    {
//        return [
//            "image" => "BehatTestUpdateImage",
//            "project" => $id
//        ];
//    }

    public function prepareCreateUserRequestPayload()
    {
        $userMapper = new MapperUser();

        $userMapper->setUser("behat1@test.com",
            ['user'],
            "000",
            "behat1"
        );

        return $userMapper->getUserAsArray();
    }

    public function prepareRequestWithUserId($id)
    {
        return [
            "user" => $id
        ];
    }

    public function prepareUserLoginRequestPayload()
    {
        return [
            "username"=>"behat1",
            "password"=>"000"
        ];
    }

    public function prepareCreateProfileRequestPayload()
    {
        $profileMapper = new MapperProfile();

        $profileMapper->setProfile(
            "behat1",
            "behat1",
            "istanbul, turkey",
            "behat test",
            "behatImage"
        );

        return $profileMapper->getProfileAsArray();
    }

    public function prepareCreateAdminRequestPayload()
    {
        $adminMapper = new MapperAdmin();

        $adminMapper->setAdmin("behatAdmin1@test.com",
            ['user'],
            "000",
            "behatAdmin1"
        );

        return $adminMapper->getAdminAsArray();
    }
}