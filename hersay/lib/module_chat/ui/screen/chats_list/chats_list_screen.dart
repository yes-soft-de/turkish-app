import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_chat/ui/widget/chat_item_card/chat_item_card.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ChatsListScreen extends StatefulWidget {

  @override
  _ChatsListScreenState createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String chatRoomId;

  bool initiated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return _screenUi();
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
