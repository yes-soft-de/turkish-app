import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hersay/module_chat/model/chat/chat_model.dart';
import 'package:hersay/module_chat/repository/chat/chat_repository.dart';
import 'package:hersay/module_chat/request/roomId_request/roomId_request.dart';
import 'package:hersay/module_chat/response/chats_response/chats_response.dart';
import 'package:inject/inject.dart';

@provide
class ChatManager {
  final ChatRepository _chatRepository;

  ChatManager(this._chatRepository);

  Stream<QuerySnapshot> getMessages(String chatRoomID) {
    return _chatRepository.requestMessages(chatRoomID);
  }

  void sendMessage(String chatRoomID, ChatModel chatMessage) {
    _chatRepository.sendMessage(chatRoomID, chatMessage);
  }

  Future<String>  getRoomId(RoomIdRequest request)async => _chatRepository.getRoomId(request);

  Future<ChatsResponse> getMyChats()async => _chatRepository.getMyChats();
}
