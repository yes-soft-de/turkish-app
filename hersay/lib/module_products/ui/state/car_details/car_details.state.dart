import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

abstract class CarDetailsState {
  final CarDetailsScreenState screenState;

  CarDetailsState(this.screenState);

  Widget getUI(BuildContext context);
}

class CarDetailsStateInit extends CarDetailsState {
  CarDetailsStateInit(CarDetailsScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to CarDetails Screen'),
    );
  }
}

class CarDetailsStateLoading extends CarDetailsState {
  CarDetailsStateLoading(CarDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CarDetailsStateUnauthorized extends CarDetailsState {
  CarDetailsStateUnauthorized(CarDetailsScreenState screenState)
      : super(screenState);

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

class CarDetailsStateDataLoaded extends CarDetailsState {
  final CarModel car;
  final List<Widget> comments;
  CarDetailsStateDataLoaded(
      this.car, this.comments, CarDetailsScreenState screenState)
      : super(screenState);
  TextEditingController _comment = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).details,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ProjectColors.THEME_COLOR,
        actions: [
          IconButton(
            icon: Icon(Icons.report),
            onPressed: () {
              screenState.report();
            },
          ),
          car.editable
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, ProductsRoutes.ADD_CAR_SCREEN,
                        arguments: car);
                  },
                )
              : Container(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          screenState.getCarDetails();
          return Future.delayed(Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ProjectColors.THEME_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Text(
                          '${car.title}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 65,
                            width: 65,
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage('${car.userImage}'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${car.userName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    car.isLoved
                        ? IconButton(
                            onPressed: () {
                              screenState.unLoveCar(car);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              screenState.loveCar(car);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          ),
                  ],
                ),
                // owner

                // car image
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(car.image ??
                              'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        //TODO : change this
                        color: ProjectColors.THEME_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ProductsRoutes.PRODUCT_IMAGES,
                              arguments: car.images);
                        },
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.picture_in_picture,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).showPics,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //car details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).type + ' : ${car.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      S.of(context).traveledDistance + ' : ${car.distance} KM'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).yearOfRelease +
                      ' : ${car.yearOfProdaction}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).gearType + ' : ${car.gearType}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).country + ' : ${car.country}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).city + ' : ${car.city}'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ProjectColors.THEME_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      S.of(context).price + '  ${car.price} \$',
                      style: TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {
                        screenState.getRoomId();
                      },
                      child: Text(
                        S.of(context).chatWithOwner,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {
                        screenState.getRoomIdWithLawyer();
                      },
                      child: Text(
                        S.of(context).chatWithLawyer,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ProjectColors.THEME_COLOR),
                    width: MediaQuery.of(context).size.width,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, left: 8.0, top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[900]
                                      : ProjectColors.BACKGROUND_COLOR,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                controller: _comment,
                                decoration: InputDecoration(
                                  hintText: '${S.of(context).commentHint}',
                                  prefixIcon: Icon(Icons.comment),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(13),
                                ),
                                onChanged: (v) {
                                  screenState.refresh();
                                },
                                onEditingComplete: () =>
                                    FocusScope.of(context).unfocus(),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              Icons.check,
                            ),
                            color: Colors.white,
                            disabledColor: Colors.grey,
                            onPressed: _comment.text.trim().isNotEmpty
                                ? () {
                                    screenState.placeComment(
                                        _comment.text, 'car', car.id);
                                  }
                                : null),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 4, left: 4),
                  child: Divider(
                    color: ProjectColors.THEME_COLOR,
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  child: Text(
                    '${S.of(context).comments}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: comments,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarDetailsStateError extends CarDetailsState {
  final String errorMsg;

  CarDetailsStateError(this.errorMsg, CarDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
