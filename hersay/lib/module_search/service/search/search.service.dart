import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:hersay/module_search/manager/search/search.manager.dart';
import 'package:hersay/module_search/model/search/search_model.dart';
import 'package:hersay/module_search/request/filtered_search/filtered_search_request.dart';
import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:inject/inject.dart';

@provide
class SearchService {
  final SearchManager _searchManager;
  final ProfileService _profileService;
  SearchService(this._searchManager, this._profileService);

  Future<List<SearchModel>> search(String searchQuery) async {
    SearchResponse response = await _searchManager.search(searchQuery);
    if (response == null) return null;

    return SearchModel.getSearchModelResult(response);
  }

  Future<List<SearchModel>> filteredSearch(String entity, String city,
      String lowestPrice, String highestPrice, int id) async {
    FilteredSearchRequest searchRequest = new FilteredSearchRequest(
        categoryID: id,
        lowestPrice: lowestPrice,
        highestPrice: highestPrice,
        city: city,
        entity: entity);

    SearchResponse response =
        await _searchManager.filteredSearch(searchRequest);
    if (response == null) return null;
    response = await filterResponse(response);
    return SearchModel.getSearchModelResult(response, entity: entity);
  }

  Future<SearchResponse> filterResponse(SearchResponse searchData) async {
    var blackList = await _profileService.getBlackList();
    if (blackList.isEmpty) {
      return searchData;
    }
    searchData.data
        .removeWhere((element) => blackList.contains(element.userName));
    return searchData;
  }
}
