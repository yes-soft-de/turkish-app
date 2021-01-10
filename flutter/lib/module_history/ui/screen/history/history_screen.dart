import 'package:flutter/material.dart';
import 'package:hersay/module_history/ui/widget/history_card/history_card.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, 'History'),
      drawer: TurkishNavigationDrawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: HistoryCard(
                product: 'Maclarn',
                productType: PRODUCT_TYPE.CAR,
                operationType: 'sell',
              ),
            );
          }),
    );
  }
}
