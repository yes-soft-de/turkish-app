

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_search/search_routes.dart';
import 'package:hersay/module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:inject/inject.dart';

@provide
class SearchModule extends YesModule{
  final SearchScreen _searchScreen;
  final AdvancedSearchScreen _advancedSearchScreen;

  SearchModule(this._searchScreen,this._advancedSearchScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SearchRoutes.SEARCH_SCREEN_ROUTE: (context) => _searchScreen,
      SearchRoutes.ADVANCED_SEARCH_SCREEN_ROUTE: (context) => _advancedSearchScreen,
    };
  }
}