import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_search/state_manager/advanced_search/advanced_search.state_manager.dart';
import 'package:hersay/module_search/ui/state/advanced_search/advanced_search.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class AdvancedSearchScreen extends StatefulWidget {
  final AdvancedSearchStateManager _stateManager;

  AdvancedSearchScreen(this._stateManager);

  @override
   AdvancedSearchScreenState createState() =>  AdvancedSearchScreenState();
}

class  AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _AdvancedSearchController = TextEditingController();

   AdvancedSearchState currentSate ;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    currentSate = AdvancedSearchStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentSate = event;

        if(this.mounted){
          setState(() {

          });

      }
    });

  }

  void advancedSearch(String entity, String city , int lowestPrice, int highestPrice){
    widget._stateManager.advancedSearch(entity,city,lowestPrice,highestPrice, this)  ;
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
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).advancedSearch),
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
              S.of(context).goBack,
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
