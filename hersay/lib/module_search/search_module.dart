

import 'package:flutter/cupertino.dart';
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_search/search_routes.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:inject/inject.dart';

@provide
class SearchModule extends YesModule{
  final SearchScreen _searchScreen;

  SearchModule(this._searchScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      SearchRoutes.SEARCH_SCREEN_ROUTE: (context) => _searchScreen,
    };
  }
}