import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_search/service/search/search.service.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:hersay/module_search/ui/state/search/search.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class SearchStateManager {
  final SearchService _service;
  final PublishSubject<SearchState> _stateSubject = new PublishSubject();
  Stream<SearchState> get stateStream => _stateSubject.stream;

  SearchStateManager(
    this._service,
  );

  void search(String searchQuery, SearchScreenState screenState) {
    _stateSubject.add(SearchStateLoading(screenState));

    _service.search(searchQuery).then((value) {
      if (value == null) {
        _stateSubject
            .add(SearchStateError(S.current.dataNotFound, screenState));
      } else {
        _stateSubject
            .add(SearchStateDataLoaded(value, screenState, searchQuery));
      }
    });
  }
}
