import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/state_manager/home/home.state_manager.dart';
import 'package:hersay/module_home/ui/state/home/home.state.dart';
import 'package:hersay/module_home/ui/widget/vertical_fab/vertical_fab.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class HomeScreen extends StatefulWidget {
  final HomeStateManager _stateManager;

  HomeScreen(
      this._stateManager,
      );

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeState currentState;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<HomeElement> products = [
    new HomeElement(
      image:
          'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg',
      category: 'sport car',
      likes: 100,
      owner: 'ali',
      product: 'Maclarn',
      specification: '1500 KM',
      type: PRODUCT_TYPE.CAR,
    ),
    new HomeElement(
      image: 'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png',
      category: 'Laptop',
      likes: 100,
      owner: 'mo',
      product: 'Dell',
      specification: 'Core i7',
      type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
    ),
    new HomeElement(
      image:
          'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg',
      category: 'House',
      likes: 100,
      owner: 'sami',
      product: 'House',
      specification: '250 SM',
      type: PRODUCT_TYPE.REAL_ESTATE,
    ),
    new HomeElement(
      image:
          'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg',
      category: 'sport car',
      likes: 100,
      owner: 'ali',
      product: 'Maclarn',
      specification: '1500 KM',
      type: PRODUCT_TYPE.CAR,
    ),
    new HomeElement(
      image: 'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png',
      category: 'Laptop',
      likes: 100,
      owner: 'mo',
      product: 'Dell',
      specification: 'Core i7',
      type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
    ),
    new HomeElement(
      image:
          'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg',
      category: 'House',
      likes: 100,
      owner: 'sami',
      product: 'House',
      specification: '250 SM',
      type: PRODUCT_TYPE.REAL_ESTATE,
    ),
  ];

  @override
  void initState() {
    super.initState();
    currentState = HomeStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });

    widget._stateManager.getHomeScreenData(this);

  }

  void refresh(){
    setState(() {

    });
  }

  void getHomeScreenData(){
    widget._stateManager.getHomeScreenData(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: TurkishNavigationDrawer(),
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).home),
      body: currentState.getUI(context),
      floatingActionButton: VerticalFab(),
    );
  }

//  Widget _screenUi() {
//    return Scaffold(
//      key: _scaffoldKey,
//      drawer: TurkishNavigationDrawer(),
//      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, 'Home'),
//      body: ListView.builder(
//          itemCount: products.length,
//          itemBuilder: (BuildContext context, int index) {
//            return GestureDetector(
//              onTap: () {
//                switch (products[index].type) {
//                  case PRODUCT_TYPE.CAR:
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => CarDetailsScreen()));
//                    break;
//                  case PRODUCT_TYPE.ELECTRONIC_DEVICE:
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) =>
//                                ElectronicDeviceDetailsScreen()));
//                    break;
//                  case PRODUCT_TYPE.REAL_ESTATE:
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => HouseDetailsScreen()));
//                    break;
//                }
//              },
//              child: Container(
//                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                child: ProductCard(
//                  image: products[index].image,
//                  category: products[index].category,
//                  likes: products[index].likes,
//                  owner: products[index].owner,
//                  product: products[index].product,
//                  specification: products[index].specification,
//                  type: products[index].type,
//                ),
//              ),
//            );
//          }),
//      floatingActionButton: VerticalFab(),
//    );
//  }
}
