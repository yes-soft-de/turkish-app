<?php


namespace App\Response;


class GetNotificationResponse
{
    public $createdAt;

    public $username;

    public $userImage;

    public $entityName;

    /**
     * @return mixed
     */
    public function getUserImage()
    {
        return $this->userImage;
    }

    /**
     * @param mixed $userImage
     */
    public function setUserImage($userImage): void
    {
        $this->userImage = $userImage;
    }

}