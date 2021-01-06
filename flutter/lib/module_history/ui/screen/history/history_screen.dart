import 'package:flutter/material.dart';
import 'package:turkesh/module_history/ui/widget/history_card/history_card.dart';
import 'package:turkesh/utils/enums/products/products.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'History'),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return Container(
              padding:EdgeInsets.symmetric(vertical: 0) ,

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
