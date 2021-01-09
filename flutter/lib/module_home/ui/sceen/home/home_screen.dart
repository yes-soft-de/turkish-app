import 'package:flutter/material.dart';
import 'package:turkesh/module_home/model/home/home_model.dart';
import 'package:turkesh/module_home/ui/widget/home_fab/home_fab.dart';
import 'package:turkesh/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:turkesh/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:turkesh/module_products/ui/screen/house_details/house_details_screen.dart';
import 'package:turkesh/utils/enums/products/products.dart';
import 'package:turkesh/utils/widgets/product_card/product_card.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeModel> products =[
    new HomeModel(
      image: 'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg',
      category: 'sport car',
      likes: 100,
      owner: 'ali',
      product: 'Maclarn',
      specification: '1500 KM',
      type: PRODUCT_TYPE.CAR,
    ),
    new HomeModel(
      image:    'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png',
      category: 'Laptop',
      likes: 100,
      owner: 'mo',
      product: 'Dell',
      specification: 'Core i7',
      type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
    ),
    new HomeModel(
      image: 'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg',
      category: 'House',
      likes: 100,
      owner: 'sami',
      product: 'House',
      specification: '250 SM',
      type: PRODUCT_TYPE.REAL_ESTATE,
    ),
    new HomeModel(
      image: 'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg',
      category: 'sport car',
      likes: 100,
      owner: 'ali',
      product: 'Maclarn',
      specification: '1500 KM',
      type: PRODUCT_TYPE.CAR,
    ),
    new HomeModel(
      image:    'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png',
      category: 'Laptop',
      likes: 100,
      owner: 'mo',
      product: 'Dell',
      specification: 'Core i7',
      type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
    ),
    new HomeModel(
      image:'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg',
      category: 'House',
      likes: 100,
      owner: 'sami',
      product: 'House',
      specification: '250 SM',
      type: PRODUCT_TYPE.REAL_ESTATE,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishAppBar(context, 'Home'),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder:(BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                switch(products[index].type){
                  case PRODUCT_TYPE.CAR : Navigator.push(context, MaterialPageRoute(builder: (context)=> CarDetailsScreen()));break;
                  case PRODUCT_TYPE.ELECTRONIC_DEVICE : Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectronicDeviceDetailsScreen()));break;
                  case PRODUCT_TYPE.REAL_ESTATE : Navigator.push(context, MaterialPageRoute(builder: (context)=> HouseDetailsScreen()));break;
                }
              },
              child: Container(
                padding:EdgeInsets.symmetric(horizontal: 8,vertical: 10) ,

                child: ProductCard(
                  image: products[index].image,
                  category:  products[index].category,
                  likes:  products[index].likes,
                  owner:  products[index].owner,
                  product:  products[index].product,
                  specification:   products[index].specification,
                  type:  products[index].type,
                ),
              ),
            );
          }),
//      floatingActionButton: HomeFab(),
    );

  }
}
