import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/screen/house_details/house_details_screen.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';



abstract class HomeState {
  final HomeScreenState screenState;

  HomeState(this.screenState);

  Widget getUI(BuildContext context);
}

class HomeStateInit extends HomeState {
  HomeStateInit(HomeScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to Home Screen'),
    );
  }
}

class HomeStateLoading extends HomeState {
  HomeStateLoading(HomeScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeStateUnauthorized extends HomeState {
  HomeStateUnauthorized(HomeScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeStateDataLoaded extends HomeState {
  final HomeModel homeData;
  List<HomeElement> displayedProducts = [];

  HomeStateDataLoaded(this.homeData, HomeScreenState screenState)
      : super(screenState){
    displayedProducts = homeData.realEstates;
  }

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        screenState.getHomeScreenData();
        return Future.delayed(Duration(seconds: 3));
      },
      child:Stack(
        children: [
          ListView.builder(
              itemCount: displayedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    switch (displayedProducts[index].type) {
                      case PRODUCT_TYPE.CAR:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarDetailsScreen()));
                        break;
                      case PRODUCT_TYPE.ELECTRONIC_DEVICE:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ElectronicDeviceDetailsScreen()));
                        break;
                      case PRODUCT_TYPE.REAL_ESTATE:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HouseDetailsScreen()));
                        break;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: ProductCard(
                      image: displayedProducts[index].image,
                      category: displayedProducts[index].category,
                      likes: displayedProducts[index].likes,
                      owner: displayedProducts[index].owner,
                      product: displayedProducts[index].product,
                      specification: displayedProducts[index].specification,
                      type: displayedProducts[index].type,
                    ),
                  ),
                );
              }),

          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Container(
              color: Colors.white,
              margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  IconButton(
                      onPressed: () {
                       displayedProducts = homeData.realEstates;
                        screenState.refresh();
                      },
                      icon:  Icon(Icons.home)
                  ),
                  IconButton(
                      onPressed: () {
                        displayedProducts = homeData.cars;
                        screenState.refresh();
                      },
                      icon:  Icon(Icons.directions_car)
                  ),
                  IconButton(
                      onPressed: () {
                        displayedProducts = homeData.electronicDevices;
                        screenState.refresh();
                      },
                      icon:  Icon(Icons.phone_iphone)
                  ),

                ],
              ),
            ),
          ),
        ],
      )


    );
  }


}

class HomeStateError extends HomeState {
  final String errorMsg;

  HomeStateError(this.errorMsg, HomeScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}