

import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_history/service/history/history.service.dart';
import 'package:hersay/module_history/ui/screen/history/history_screen.dart';
import 'package:hersay/module_history/ui/state/history/history.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class HistoryStateManager{
  final HistoryService _service;
  PublishSubject<HistoryState> _stateSubject = new PublishSubject();
  Stream<HistoryState> get stateStream  => _stateSubject.stream;
  
  HistoryStateManager(
      this._service,
      );

  void getHistory(HistoryScreenState screenState) {
    _stateSubject.add(HistoryStateLoading(screenState));
    _service.getHistory().then((value) {
      if (value == null) {
        _stateSubject
            .add(HistoryStateError(S.current.youDidNotSellOrBuyAnyThingYet, screenState));
      } else {
        _stateSubject.add(HistoryStateDataLoaded(value, screenState));
      }
    });
  }
  
}