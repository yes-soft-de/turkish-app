import 'package:flutter/material.dart';
import 'package:turkesh/module_chat/ui/widget/chat_item_card/chat_item_card.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class ChatsListScreen extends StatefulWidget {
  @override
  _ChatsListScreenState createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'Chats'),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return Container(
              child: ChatItemCard(
                userName: 'zolfekar seleten',
                userImage:'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'
              ),

            );
          }),
    );
  }
}
