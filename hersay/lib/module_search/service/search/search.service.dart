
import 'package:hersay/module_search/manager/search/search.manager.dart';
import 'package:hersay/module_search/model/search/search_model.dart';
import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:inject/inject.dart';

@provide
class SearchService{
  final SearchManager _searchManager;

  SearchService(
      this._searchManager,
      );

  Future<List<SearchModel>> search(String searchQuery)async{
    SearchResponse response = await _searchManager.search(searchQuery);
    if(response == null) return null;

     return SearchModel.getSearchModelResult(response);
  }
}