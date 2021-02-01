
import 'package:hersay/module_search/service/search/search.service.dart';
import 'package:hersay/module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart';
import 'package:hersay/module_search/ui/state/advanced_search/advanced_search.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AdvancedSearchStateManager{
  final SearchService _service;
  final PublishSubject<AdvancedSearchState> _stateSubject = new PublishSubject();
  Stream<AdvancedSearchState> get stateStream => _stateSubject.stream;

  AdvancedSearchStateManager(
      this._service,
      );

  void advancedSearch(
      String entity,
      String city,
      int price,
      AdvancedSearchScreenState screenState){
    _stateSubject
        .add(AdvancedSearchStateLoading(  screenState));

    _service.filteredSearch(entity,city,price).then((value) {
      if (value == null) {
        _stateSubject
            .add(AdvancedSearchStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(AdvancedSearchStateDataLoaded(value, screenState));
      }
    });
  }
}