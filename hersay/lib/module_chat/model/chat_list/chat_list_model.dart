import 'package:date_time_picker/date_time_picker.dart';
import 'package:hersay/module_chat/response/chats_response/chats_response.dart';

class ChatListModel {
  String roomID;
  String username;
  String image;
  String startAt;

  ChatListModel({this.roomID, this.username, this.image, this.startAt});

 static List<ChatListModel> getChats(ChatsResponse response){
   List<ChatListModel> result = [];
   var df = new DateFormat('hh:mm dd/MM/yyyy');

   response.data.forEach((element) {
     var date = new DateTime.fromMillisecondsSinceEpoch(element.startAt.timestamp * 1000);


     result.add(new ChatListModel(
       image: element.image,
       roomID: element.roomID,
       username: element.username,
       startAt: df.format(date),
     ));
   });

   return result;
 }


}