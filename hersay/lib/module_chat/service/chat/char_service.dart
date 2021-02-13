import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hersay/module_chat/manager/chat/chat_manager.dart';
import 'package:hersay/module_chat/model/chat/chat_model.dart';
import 'package:hersay/module_chat/model/chat_list/chat_list_model.dart';
import 'package:hersay/module_chat/request/roomId_request/roomId_request.dart';
import 'package:hersay/module_chat/response/chats_response/chats_response.dart';
import 'package:hersay/utils/logger/logger.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ChatService {
  final ChatManager _chatManager;

  ChatService(this._chatManager);

  // This is Real Time, That is Why I went this way
  final PublishSubject<List<ChatModel>> _chatPublishSubject =
      new PublishSubject();

  Stream<List<ChatModel>> get chatMessagesStream => _chatPublishSubject.stream;

  void requestMessages(String chatRoomID) async {
    _chatManager.getMessages(chatRoomID).listen((event) {
      List<ChatModel> chatMessagesList = [];
      event.docs.forEach((element) {
        chatMessagesList.add(new ChatModel.fromJson(element.data()));
        Logger().info('char_service.dart', jsonEncode(element.data()));
      });

      _chatPublishSubject.add(chatMessagesList);
    });
  }

  void sendMessage(String chatRoomID, String msg) async {
    FirebaseAuth auth = await FirebaseAuth.instance;
    User user = auth.currentUser;
    ChatModel model = new ChatModel(
        msg: msg, sender: user.uid, sentDate: DateTime.now().toIso8601String());
    await _chatManager.sendMessage(chatRoomID, model);
  }

  void dispose() {
    _chatPublishSubject.close();
  }

  Future<String>  getRoomId(String entity,int itemId)async{
    RoomIdRequest request = new RoomIdRequest(
      entity: entity,
      itemID: '$itemId',
      lawyer: 0
    );
    return _chatManager.getRoomId(request);
  }

  Future<String>  getRoomIdWithLawyer(String entity,int itemId)async{
    RoomIdRequest request = new RoomIdRequest(
        entity: entity,
        itemID: '0',
        lawyer: 1
    );
    return _chatManager.getRoomId(request);
  }

  Future<List<ChatListModel>> getMyChats()async{
      ChatsResponse response = await _chatManager.getMyChats();
      if(response == null) return null;
      return ChatListModel.getChats(response)  ;
  }



}
