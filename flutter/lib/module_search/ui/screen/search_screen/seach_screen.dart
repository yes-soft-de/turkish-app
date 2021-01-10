import 'package:flutter/material.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class SearchScreen extends StatefulWidget {
//  final SearchStateManager _stateManager;

//  SearchScreen(this._stateManager);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _searchController = TextEditingController();

//  SearchState currentSate = SearchStateInit();
//  List<SearchModel> searchResult = [];
  bool loading = false;

//  @override
//  void initState() {
//    widget._stateManager.stateStream.listen((event) {
//      currentSate = event;
//      if(currentSate is SearchStateFetchingSuccess){
//        loading = false;
//        SearchStateFetchingSuccess state = currentSate;
//        searchResult = state.data;
//        if(this.mounted){
//          setState(() {
//
//          });
//        }
//      }
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return /*loading?
                LoadingIndicatorWidget():*/
        _screenUi();
  }

  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      drawer: TurkishNavigationDrawer(),
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, 'Search'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Center(
                child: TextFormField(
                  controller: _searchController,
                  onFieldSubmitted: (value) {
//              loading = true;
//              widget._stateManager.searchAnime(_searchController.text.trim());
                  },
                  decoration: InputDecoration(
                    hintText:
                        'what you want to seach about' /*S.of(context).searchForAnAnime*/,
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          loading = true;
                          setState(() {});
//                widget._stateManager.searchAnime(_searchController.text.trim());
                          print('fff');
                        }),
                  ),
                  validator: (result) {
                    if (result.isEmpty) {
                      return 'عن ماذا تريد البحث';
                    }
                    return null;
                  },
                ),
              ),

//            if(searchResult.isNotEmpty)
//              ListView.builder(
//                  shrinkWrap: true,
//                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
//                  physics: NeverScrollableScrollPhysics(),
//                  itemCount: searchResult.length,
//                  itemBuilder: (BuildContext context, int index){
//                    return Container(
//                      margin: EdgeInsets.all(10),
//                      child: GestureDetector(
//                        onTap: ()=> Navigator.pushNamed(
//                            context,
//                          AnimeRoutes.ROUTE_ANIME_DETAILS_SCREEN ,
//                          arguments: searchResult[index].animeId
//                        ),
//                        child: AnimeCardWidget(
//                          name: searchResult[index].animeName,
//                          image: searchResult[index].animeImage,
//                          category: searchResult[index].animeCategory,
//                        ),
//                      ),
//                    );
//                  }
//              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: ProjectColors.THEME_COLOR,
          height: 65,
          child: Center(
            child: Text(
              'Go Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
