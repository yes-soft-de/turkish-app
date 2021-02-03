<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Manager\MessageManager;
use App\Request\ChatCreateRequest;
use ChatCreateResponse;

class MessageService
{
    private $autoMapping;
    private $carService;
    private $deviceService;
    private $realEstateService;
    private $statusService;
    private $messageManager;

    public function __construct(AutoMapping $autoMapping, MessageManager $messageManager, DeviceService $deviceService, RealEstateService $realEstateService,
     CarService $carService, StatusService $statusService)
    {
        $this->autoMapping = $autoMapping;
        $this->messageManager = $messageManager;
        $this->carService = $carService;
        $this->deviceService = $deviceService;
        $this->realEstateService = $realEstateService;
        $this->statusService = $statusService;
    }

    public function chatWithOwner(ChatCreateRequest $request)
    {
        $roomID = $this->roomID();

        $request->setRoomID($roomID);

        $result = $this->messageManager->chatWithOwner($request);

        return $this->autoMapping->map(MessageEntity::class, ChatCreateResponse::class, $result);
    }

    // for generate roomID
    public function roomID()
    {
        $data = random_bytes(16);

        $data[0] = chr(ord('a') ); 
        $data[1] = chr(ord('v') ); 
        $data[2] = chr(ord('s') ); 
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

        return  vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

}