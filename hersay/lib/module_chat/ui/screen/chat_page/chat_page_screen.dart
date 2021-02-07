import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_chat/bloc/chat_page/chat_page.bloc.dart';
import 'package:hersay/module_chat/model/chat/chat_model.dart';
import 'package:hersay/module_chat/ui/widget/chat_bubble/chat_bbuble.dart';
import 'package:hersay/module_chat/ui/widget/chat_witer/chat_writer.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:inject/inject.dart';

@provide
class ChatScreen extends StatefulWidget {
  final ChatPageBloc _chatPageBloc;
  final ImageUploadService _uploadService;

  ChatScreen(
      this._chatPageBloc,
      this._uploadService,
      );

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<ChatModel> _chatMessagesList = [];
  int currentState = ChatPageBloc.STATUS_CODE_INIT;

  List<ChatBubbleWidget> chatsMessagesWidgets = [];

  String chatRoomId;

  bool initiated = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    widget._chatPageBloc.chatBlocStream.listen((event) {
      currentState = event.first;
      if (event.first == ChatPageBloc.STATUS_CODE_GOT_DATA) {
        _chatMessagesList = event.last;
        if (chatsMessagesWidgets.length == _chatMessagesList.length) {
        } else {
          buildMessagesList(_chatMessagesList).then((value) {
            if (this.mounted) setState(() {

            });
            _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentState == ChatPageBloc.STATUS_CODE_INIT) {
      chatRoomId = ModalRoute.of(context).settings.arguments;
      widget._chatPageBloc.getMessages(chatRoomId);
    }

    return Scaffold(
      body: Column(
        // direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBar(
            backgroundColor: ProjectColors.THEME_COLOR,
            title: Text(
              S.of(context).chatRoom,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Expanded(
            child: chatsMessagesWidgets != null
                ? ListView(
              controller: _scrollController,
              reverse: false,
              shrinkWrap: true,
              children: chatsMessagesWidgets,

            )
                : Center(
              child: Text(S.of(context).loading),
            ),
          ),
          ChatWriterWidget(
            onMessageSend: (msg) {
              widget._chatPageBloc.sendMessage(chatRoomId, msg);

            },
            uploadService: widget._uploadService,
          ),
        ],
      ),
    );
  }

  Future<void> buildMessagesList(List<ChatModel> chatList) async {
    List<ChatBubbleWidget> newMessagesList = [];
    FirebaseAuth auth = await FirebaseAuth.instance;
    User user = auth.currentUser;
    chatList.forEach((element) {
      newMessagesList.add(ChatBubbleWidget(
        message: element.msg,
        me: element.sender == user.uid ? true : false,
        sentDate: DateTime.parse(element.sentDate),
      ));
    });
    chatsMessagesWidgets = newMessagesList;

    return;
  }

}
