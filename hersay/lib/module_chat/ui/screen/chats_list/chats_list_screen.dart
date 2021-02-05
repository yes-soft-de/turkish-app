import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_chat/state_manager/chats_list/chat_list.state_manger.dart';
import 'package:hersay/module_chat/ui/state/chat_list/chat_list.state.dart';
import 'package:hersay/module_chat/ui/widget/chat_item_card/chat_item_card.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ChatsListScreen extends StatefulWidget {
  final ChatsListStateManager _stateManager;
  final AuthService _authService;

  ChatsListScreen(
      this._stateManager,
      this._authService,
      );

  @override
  ChatsListScreenState createState() => ChatsListScreenState();
}

class ChatsListScreenState extends State<ChatsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  ChatsListState currentState;

  @override
  void initState() {
    super.initState();
    currentState = ChatsListStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });

    widget._stateManager.getChatsLists(this);

  }

  void getChatsLists(){
    widget._stateManager.getChatsLists(this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        Navigator.of(context).pushNamed(
            AuthorizationRoutes.LOGIN_SCREEN,
            arguments: ChatRoutes.chatsListRoute,
        );
      }
    });

    return  Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).chats),
      drawer: TurkishNavigationDrawer(),
      body:currentState.getUI(context),
    );



  }






  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).chats),
      drawer: TurkishNavigationDrawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(
                  ChatRoutes.chatRoute,
                  arguments: 'higuygbk'/*currentOrder.chatRoomId*/,
                );
              },
              child: Container(
                child: ChatItemCard(
                    userName: 'zolfekar seleten',
                    userImage:
                        'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'),
              ),
            );
          }),
    );
  }
}
