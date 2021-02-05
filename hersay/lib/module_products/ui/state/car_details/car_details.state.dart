
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
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
                Container(
                  decoration: BoxDecoration(
                    color: ProjectColors.THEME_COLOR,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car,color: Colors.white,),
                      SizedBox(width: 10,),
                      Center(
                        child:      Text(
                          '${car.brand}',
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
                              backgroundImage: NetworkImage(
                                  '${car.userImage}'),
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
                        ? Icon(
                      Icons.favorite,
                      color: ProjectColors.THEME_COLOR,
                    )
                        : IconButton(
                      onPressed: (){
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
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              car.image?? 'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg'))),
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
                        onPressed: () {},
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.picture_in_picture,
                              color: Colors.white,
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
                  child: Text(S.of(context).type+' ${car.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).brand+' ${car.brand}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).traveledDistance+' ${car.distance} KM'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).dureationOfUse+' ${car.useDuration}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).gearType+' ${car.gearType}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('CC : ${car.cc} CC'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).cylynder+' ${car.cylinder}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).fuel+' ${car.fuel}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).location+' ${car.location}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).plated),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).price+'${car.price} \$'),
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
                      onPressed: () {},
                      child: Text(
                        S.of(context).chatWithLawyer,
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