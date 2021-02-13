import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/model/chat/chat_model.dart';
import 'package:hersay/module_chat/request/roomId_request/roomId_request.dart';
import 'package:hersay/module_chat/response/chats_response/chats_response.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

@provide
class ChatRepository {
  final ApiClient _apiClient;
  final AuthService _authService;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ChatRepository(
      this._apiClient,
      this._authService,
      );

  Stream<QuerySnapshot> requestMessages(String chatRoomID) {
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('sentDate', descending: false)
        .snapshots();
  }

  void sendMessage(String chatRoomID, ChatModel chatMessage) {
    _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(chatMessage.toJson());
  }

  Future<String>  getRoomId(RoomIdRequest request)async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
        Urls.CHAT,
        request.toJson(),
        headers: {'Authorization':'Bearer '+token}
    );

    if(response == null) return null;

    return response['Data']['roomID'];
  }

  Future<ChatsResponse> getMyChats()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
      Urls.MY_CHATS,
      headers: {'Authorization':'Bearer '+token}
    );

    if(response == null) return null;

    return ChatsResponse.fromJson(response);
  }
}
