<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\MessageEntity;
use App\Manager\MessageManager;
use App\Request\ChatCreateRequest;
use App\Response\ChatCreateResponse;
use App\Response\ChatListGetResponse;
use App\Service\UserService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class MessageService
{
    private $autoMapping;
    private $messageManager;
    private $userService;
    private $params;

    public function __construct(AutoMapping $autoMapping, MessageManager $messageManager, ParameterBagInterface $params, 
    UserService $userService)
    {
        $this->autoMapping = $autoMapping;
        $this->messageManager = $messageManager;
        $this->userService = $userService;
        $this->params = $params->get('upload_base_url').'/';
    }

    public function chatWithOwner(ChatCreateRequest $request)
    {
        $roomID = $this->roomID();

        $request->setRoomID($roomID);

        if($request->getLawyer() == 0)
        {
            $result = $this->messageManager->chatWithOwner($request);
        }
        elseif($request->getLawyer() == 1)
        {
            $lawyerID = $this->userService->getLawyer()[0]->getUserID();
            //dd($this->userService->getLawyer()[0]->getUserID());
            $request->setUserTwo($lawyerID);

            $result = $this->messageManager->chatWithLawyer($request);
        }

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

    public function getChatListOfUser($userID)
    {
        $response = [];

        $chatResults = $this->messageManager->getChatListOfUser($userID);

        foreach($chatResults as $row)
        {
            $row['image'] = $this->params . $row['image'];

            $response[] = $this->autoMapping->map('array', ChatListGetResponse::class, $row);
        }

        return $response;
    }

    public function deleteAllChatRequests()
    {
        return $this->messageManager->deleteAllChatRequests();
    }

}