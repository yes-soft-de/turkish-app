
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
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
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CarDetailsStateDataLoaded extends CarDetailsState {
  final CarModel car;

  CarDetailsStateDataLoaded(this.car, CarDetailsScreenState screenState)
      : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
        onRefresh: () {
          screenState.getCarDetails();
          return Future.delayed(Duration(seconds: 3));
        },
        child:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // car model
                Text(
                  '${car.brand}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // owner
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                             'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      //TODO : change this when owner name fetched from backend
                      'Atrium k',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // car image
                Container(
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              car.image?? 'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      //TODO : change this
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Icon(
                            Icons.picture_in_picture,
                            color: Colors.white,
                          ),
                          Text(
                            'Show Pics',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                //car details
                Text('Type : ${car.type}'),
                Text('Brand : ${car.brand}'),
                Text('Traveled Distance : ${car.distance} KM'),
                Text('Dureation of use : ${car.useDuration}'),
                Text('Gear Type : ${car.gearType}'),
                Text('CC : ${car.cc} CC'),
                Text('Cylynder : ${car.cylinder}'),
                Text('Fuel : ${car.fuel}'),
                Text('Location : ${car.location}'),
                Text('Plated'),
                Center(
                  child: Text('Price : ${car.price} \$'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Text(
                        'Request Lawer',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {},
                      child: Text(
                        'Request Chat',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
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