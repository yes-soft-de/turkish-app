import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_products/products_routes.dart';
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
  HomeStateLoading(HomeScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeStateUnauthorized extends HomeState {
  HomeStateUnauthorized(HomeScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeStateDataLoaded extends HomeState {
  ScrollController scrollController = ScrollController();

  final HomeModel homeData;
  int selectedMode = 1;
  List<HomeElement> displayedProducts = [];
  int selectChoice = 0;
  HomeStateDataLoaded(this.homeData, HomeScreenState screenState)
      : super(screenState) {
    displayedProducts = homeData.cars +
        homeData.realEstates +
        homeData.electronicDevices +
        homeData.advertisement;
    displayedProducts.shuffle();
  }
  resetOffset() {
    scrollController.jumpTo(1);
    screenState.refresh();
  }
  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          screenState.getHomeScreenData();
          screenState.getProfileData();
          return Future.delayed(Duration(seconds: 3));
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: selectedMode == 5 ? 110 : 80),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: displayedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (displayedProducts[index].type) {
                          case PRODUCT_TYPE.CAR:
                            Navigator.pushNamed(
                                context, ProductsRoutes.CAR_DETAILS_SCREEN,
                                arguments: displayedProducts[index].id);
                            break;
                          case PRODUCT_TYPE.ELECTRONIC_DEVICE:
                            Navigator.pushNamed(context,
                                ProductsRoutes.ELECTRONIC_DEVICE_DETAILS_SCREEN,
                                arguments: displayedProducts[index].id);
                            break;
                          case PRODUCT_TYPE.REAL_ESTATE:
                            Navigator.pushNamed(context,
                                ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
                                arguments: displayedProducts[index].id);
                            break;
                          case PRODUCT_TYPE.ADVERTISMENT:
                            Navigator.pushNamed(
                                context, ProductsRoutes.SERVICE_DETAILS_SCREEN,
                                arguments: displayedProducts[index].id);
                            break;
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: ProductCard(
                          image: displayedProducts[index].image,
                          category: displayedProducts[index].category,
                          likes: displayedProducts[index].likes,
                          owner: displayedProducts[index].owner,
                          ownerImage: displayedProducts[index].ownerImage,
                          product: displayedProducts[index].product,
                          specification: displayedProducts[index].specification,
                          type: displayedProducts[index].type,
                          comments: displayedProducts[index].comments,
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
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  displayedProducts = homeData.cars +
                                      homeData.realEstates +
                                      homeData.electronicDevices +
                                      homeData.advertisement;
                                  displayedProducts.shuffle();
                                  selectedMode = 1;
                                  resetOffset();
                                  screenState.refresh();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (selectedMode == 1)
                                        ? ProjectColors.SECONDARY_COLOR
                                        : ProjectColors.THEME_COLOR,
                                  ),
                                  child: Center(
                                    child: Text(
                                      S.of(context).all,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  displayedProducts = homeData.realEstates;
                                  selectedMode = 2;
                                  screenState.refresh();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (selectedMode == 2)
                                        ? ProjectColors.SECONDARY_COLOR
                                        : ProjectColors.THEME_COLOR,
                                  ),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  displayedProducts = homeData.cars;
                                  selectedMode = 3;
                                  resetOffset();
                                  screenState.refresh();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(55),
                                    color: (selectedMode == 3)
                                        ? ProjectColors.SECONDARY_COLOR
                                        : ProjectColors.THEME_COLOR,
                                  ),
                                  child: Icon(
                                    Icons.directions_car,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  displayedProducts =
                                      homeData.electronicDevices;
                                  selectedMode = 4;
                                  resetOffset();
                                  screenState.refresh();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (selectedMode == 4)
                                        ? ProjectColors.SECONDARY_COLOR
                                        : ProjectColors.THEME_COLOR,
                                  ),
                                  child: Icon(
                                    Icons.phone_iphone,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  displayedProducts = homeData.advertisement;
                                  selectedMode = 5;
                                  selectChoice = 0;
                                  resetOffset();
                                  screenState.refresh();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: (selectedMode == 5)
                                        ? ProjectColors.SECONDARY_COLOR
                                        : ProjectColors.THEME_COLOR,
                                  ),
                                  child: Icon(
                                    Icons.design_services,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      selectedMode == 5
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                    height: 50,
                                    child: Row(
                                        children: getCategories(
                                            homeData.categories))),
                              ),
                            )
                          : Container()
                    ],
                  )),
            ),
          ],
        ));
  }

  getCategoriesPosts(List<HomeElement> advertisement, int id) {
    List<HomeElement> filtred = [];
    advertisement?.forEach((element) {
      if (element.categoryId == id) {
        filtred.add(element);
      }
    });
    displayedProducts = filtred;
  }

  List<Widget> getCategories(List<Categories> categories) {
    List<Widget> cat = [];
    categories?.forEach((element) {
      cat.add(Padding(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(
            element.categoryName,
            style: TextStyle(
                color: selectChoice == element.categoryId
                    ? Colors.white
                    : Colors.black),
          ),
          selected: selectChoice == element.categoryId,
          selectedColor: ProjectColors.SECONDARY_COLOR,
          disabledColor: ProjectColors.THEME_COLOR,
          onSelected: (selected) {
            if (selected) {
              selectChoice = element.categoryId;
              getCategoriesPosts(homeData.advertisement, selectChoice);
              resetOffset();
            } else {
              selectChoice = null;
              displayedProducts = homeData.advertisement;
            }
            screenState.refresh();
          },
        ),
      ));
    });
    return cat;
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
