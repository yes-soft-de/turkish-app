
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_chat/model/chat_list/chat_list_model.dart';
import 'package:hersay/module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'package:hersay/module_chat/ui/widget/chat_item_card/chat_item_card.dart';

import '../../../chat_routes.dart';


abstract class ChatsListState {
  final ChatsListScreenState screenState;

  ChatsListState(this.screenState);

  Widget getUI(BuildContext context);
}

class ChatsListStateInit extends ChatsListState {
  ChatsListStateInit(ChatsListScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to ChatsList Screen'),
    );
  }
}

class ChatsListStateLoading extends ChatsListState {
  ChatsListStateLoading(ChatsListScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ChatsListStateUnauthorized extends ChatsListState {
  ChatsListStateUnauthorized(ChatsListScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ChatsListStateDataLoaded extends ChatsListState {
  List<ChatListModel> chatsList = [];

  ChatsListStateDataLoaded(this.chatsList, ChatsListScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        screenState.getChatsLists();
        return Future.delayed(Duration(seconds: 3));
      },
      child:ListView.builder(
          itemCount: chatsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(
                  ChatRoutes.chatRoute,
                  arguments: chatsList[index].roomID,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: ChatItemCard(
                    userName: chatsList[index].username,
                    userImage: chatsList[index].image,
                    time: chatsList[index].startAt ,
            ),
              )
    );

          }),


    );
  }


}

class ChatsListStateError extends ChatsListState {
  final String errorMsg;

  ChatsListStateError(this.errorMsg, ChatsListScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}