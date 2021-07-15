import 'package:hersay/module_search/repository/search.repository.dart';
import 'package:hersay/module_search/request/filtered_search/filtered_search_request.dart';
import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:inject/inject.dart';

@provide
class SearchManager {
  final SearchRepository _repository;

  SearchManager(
    this._repository,
  );

  Future<SearchResponse> search(String searchQuery) async =>
      _repository.search(searchQuery);

  Future<SearchResponse> filteredSearch(
          FilteredSearchRequest searchRequest) async =>
      _repository.filteredSearch(searchRequest);
}
