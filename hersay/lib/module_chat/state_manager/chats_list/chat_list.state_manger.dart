
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_chat/ui/screen/chats_list/chats_list_screen.dart';
import 'package:hersay/module_chat/ui/state/chat_list/chat_list.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ChatsListStateManager{
  final ChatService _service;
  PublishSubject<ChatsListState> _stateSubject = new PublishSubject();
  Stream<ChatsListState> get stateStream  => _stateSubject.stream;
  
  ChatsListStateManager(
      this._service,
      );

  void getChatsLists(ChatsListScreenState screenState) {
    _stateSubject.add(ChatsListStateLoading(screenState));
    _service.getMyChats().then((value) {
      if (value == null) {
        _stateSubject
            .add(ChatsListStateError(S.current.youDidNotChatWithAnyOne, screenState));
      } else {
        _stateSubject.add(ChatsListStateDataLoaded(value, screenState));
      }
    });
  }
  
}