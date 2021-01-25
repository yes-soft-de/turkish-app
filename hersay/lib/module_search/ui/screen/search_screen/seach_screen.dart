import 'package:flutter/material.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_search/state_manager/search/search.state_manager.dart';
import 'package:hersay/module_search/ui/state/search/search.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class SearchScreen extends StatefulWidget {
  final SearchStateManager _stateManager;

  SearchScreen(this._stateManager);

  @override
   SearchScreenState createState() =>  SearchScreenState();
}

class  SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _searchController = TextEditingController();

   SearchState currentSate ;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    currentSate = SearchStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentSate = event;

        if(this.mounted){
          setState(() {

          });

      }
    });

  }

  void search(String searchQuery){
    widget._stateManager.search(searchQuery, this)  ;
  }

  void refresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      key: _scaffoldKey,
      drawer: TurkishNavigationDrawer(),
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, 'Search'),
      body: currentSate.getUI(context),
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
