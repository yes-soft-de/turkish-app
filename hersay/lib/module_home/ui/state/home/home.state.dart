
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/screen/real_estate_details/real_estate_details_screen.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
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
  int selectedMode = 1;
  List<HomeElement> displayedProducts = [];

  HomeStateDataLoaded(this.homeData, HomeScreenState screenState)
      : super(screenState){
    displayedProducts = homeData.realEstates + homeData.cars + homeData.electronicDevices;
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
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ListView.builder(
                itemCount: displayedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      switch (displayedProducts[index].type) {
                        case PRODUCT_TYPE.CAR:
                          Navigator.pushNamed(
                              context,
                              ProductsRoutes.CAR_DETAILS_SCREEN,
                              arguments: displayedProducts[index].id
                          );
                          break;
                        case PRODUCT_TYPE.ELECTRONIC_DEVICE:
                          Navigator.pushNamed(
                              context,
                              ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
                              arguments: displayedProducts[index].id
                          );
                          break;
                        case PRODUCT_TYPE.REAL_ESTATE:

                              Navigator.pushNamed(
                              context,
                              ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
                              arguments: displayedProducts[index].id
                          );
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
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10,bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  GestureDetector(
                    onTap: (){
                      displayedProducts = homeData.realEstates + homeData.cars + homeData.electronicDevices;
                      screenState.refresh();
                    },
                    child: Container(
                      width: 50,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ProjectColors.THEME_COLOR,
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      displayedProducts = homeData.realEstates;
                      screenState.refresh();
                    },
                    child: Container(
                      width: 50,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ProjectColors.THEME_COLOR,
                      ),
                      child: Icon(
                          Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      displayedProducts = homeData.cars;
                      screenState.refresh();
                    },
                    child: Container(
                      width: 50,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ProjectColors.THEME_COLOR,
                      ),
                      child: Icon(
                          Icons.directions_car,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      displayedProducts = homeData.electronicDevices;
                      screenState.refresh();
                    },
                    child: Container(
                      width: 50,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ProjectColors.THEME_COLOR,
                      ),
                      child: Icon(
                          Icons.phone_iphone,
                        color: Colors.white,
                      ),
                    ),
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