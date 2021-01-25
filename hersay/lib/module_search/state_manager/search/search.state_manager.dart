import 'package:hersay/module_search/service/search/search.service.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:hersay/module_search/ui/state/search/search.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class SearchStateManager{
  final SearchService _service;
  final PublishSubject<SearchState> _stateSubject = new PublishSubject();
  Stream<SearchState> get stateStream => _stateSubject.stream;

  SearchStateManager(
      this._service,
      );

  void search(String searchQuery,SearchScreenState screenState){
    _service.search(searchQuery).then((value) {
      if (value == null) {
        _stateSubject
            .add(SearchStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(SearchStateDataLoaded(value, screenState, searchQuery));
      }
    });
  }
}