import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_products/service/service/service.dart';
import 'package:hersay/module_search/service/search/search.service.dart';
import 'package:hersay/module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart';
import 'package:hersay/module_search/ui/state/advanced_search/advanced_search.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AdvancedSearchStateManager {
  final SearchService _service;
  final ServiceService _categoryService;
  final PublishSubject<AdvancedSearchState> _stateSubject =
      new PublishSubject();
  Stream<AdvancedSearchState> get stateStream => _stateSubject.stream;

  AdvancedSearchStateManager(this._service, this._categoryService);

  void advancedSearch(String entity, String city, String lowestPrice,
      String highestPrice, AdvancedSearchScreenState screenState,List<Categories> categories,int id) {
    _stateSubject.add(AdvancedSearchStateLoading(screenState));
    _service
        .filteredSearch(entity, city, lowestPrice, highestPrice,id)
        .then((value) {
      if (value == null) {
        _stateSubject
            .add(AdvancedSearchStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(AdvancedSearchStateDataLoaded(value, screenState,categories));
      }
    });
  }

  void getCategories(AdvancedSearchScreenState screenState) {
    _stateSubject.add(AdvancedSearchStateLoading(screenState));
    _categoryService.getCategories().then((value) {
      if (value != null) {
        _stateSubject.add(AdvancedSearchStateInit(screenState,value));
      } else {
        _stateSubject.add(AdvancedSearchStateError('Error Fetching Data', screenState));
      }
    });
  }
}
