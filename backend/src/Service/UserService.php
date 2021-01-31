<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\UserProfileEntity;
use App\Manager\UserManager;
use App\Request\UserProfileCreateRequest;
use App\Request\UserProfileUpdateRequest;
use App\Request\UserRegisterRequest;
use App\Response\UserProfileCreateResponse;
use App\Response\UserProfileResponse;
use App\Response\UserRegisterResponse;
use App\Response\GetAllUsersResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class UserService
{
    private $autoMapping;
    private $userManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, UserManager $userManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->userManager = $userManager;

        $this->params = $params->get('upload_base_url').'/';
    }

    public function userRegister(UserRegisterRequest $request)
    {
        $userRegister = $this->userManager->userRegister($request);

        return $this->autoMapping->map(UserEntity::class,UserRegisterResponse::class, $userRegister);
    }

    public function userProfileCreate(UserProfileCreateRequest $request)
    {
        $userProfile = $this->userManager->userProfileCreate($request);
       
        if ($userProfile instanceof UserProfileEntity)
        {
            $userProfile->setImage($this->params.$userProfile->getImage());

            return $this->autoMapping->map(UserProfileEntity::class,UserProfileCreateResponse::class, $userProfile);
        }
        elseif ($userProfile == 1)
        {
            return $this->getUserProfileByUserID($request->getUserID());
        }
    }

    public function userProfileUpdate(UserProfileUpdateRequest $request)
    {
        $item = $this->userManager->userProfileUpdate($request);

        $item->setImage($this->params.$item->getImage());

        return $this->autoMapping->map(UserProfileEntity::class,UserProfileResponse::class, $item);
    }

    public function getUserProfileByUserID($userID)
    {
        $item = $this->userManager->getProfileByUserID($userID);

        $item['image'] = $this->params.$item['image'];

        return $this->autoMapping->map('array', UserProfileResponse::class, $item);

    }

    public function deleteUser($userID)
    {
        $userResult = $this->userManager->deleteUser($userID);

        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userResult);
    }

    public function getAllProfiles()
    {
        $response = [];
        $result = $this->userManager->getAllProfiles();

        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map(UserProfileEntity::class, UserProfileResponse::class, $row);
        }
        return $response;
    }

    public function getAllUsers()
    {
        $response = [];

        $users = $this->userManager->getAllUsers();

        foreach ($users as $row)
        {
            $response[] = $this->autoMapping->map(UserEntity::class, GetAllUsersResponse::class, $row);
        }

        return $response;
    }
}