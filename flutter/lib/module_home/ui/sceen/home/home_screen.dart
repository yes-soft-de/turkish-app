import 'package:flutter/material.dart';
import 'package:turkesh/module_home/ui/widget/home_fab/home_fab.dart';
import 'package:turkesh/utils/enums/products/products.dart';
import 'package:turkesh/utils/widgets/product_card/product_card.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'Home'),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return Container(
              padding:EdgeInsets.symmetric(horizontal: 8,vertical: 10) ,

              child: ProductCard(
                image: 'https://www.mepixels.com/cache/a2c3c591/car-background-only-for-pc-1140x1140-thYHcU7U9.jpeg',
                category: 'sport car',
                likes: 100,
                owner: 'ali',
                product: 'Maclarn',
                specification: '1500 KM',
                  type: PRODUCT_TYPE.CAR,
              ),
            );
          }),
      floatingActionButton: HomeFab(),
    );

  }
}
