import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/car/car_details.state_manager.dart';
import 'package:hersay/module_products/ui/state/car_details/car_details.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class CarDetailsScreen extends StatefulWidget {
  final CarDetailsStateManager _stateManager;
  final AuthService _authService;

  CarDetailsScreen(
      this._stateManager,
      this._authService,
      );

  @override
  CarDetailsScreenState createState() => CarDetailsScreenState();
}

class CarDetailsScreenState extends State<CarDetailsScreen> {
  CarDetailsState currentState;
  int carId = 0;

  @override
  void initState() {
    super.initState();
    currentState = CarDetailsStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if(this.mounted){
        setState(() {

        });
      }
    });
  }

  void loveCar(CarModel car){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: carId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.loveCar(carId, this, car);
      }
    });
  }
  void unLoveCar(CarModel car){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: carId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.unLoveCar(carId, this, car);
      }
    });
  }

  void refresh(){
    setState(() {

    });
  }

  void getCarDetails(){
    widget._stateManager.getCarDetails(this,carId);
  }

  void getRoomId(){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: carId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.getRoomId(carId, this);
      }
    });
  }
  void getRoomIdWithLawyer(){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: carId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.getRoomIdWithLawyer(carId, this);
      }
    });
  }



  void goToChat(String roomId){
    Navigator.pushNamed(
        context,
        ChatRoutes.chatRoute,
      arguments:  roomId
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentState is CarDetailsStateInit) {
      carId = ModalRoute.of(context).settings.arguments;

      getCarDetails();
    }



    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, S.of(context).details),
      body: currentState.getUI(context),
    );
  }

//  Widget _screenUi() {
//    return Scaffold(
//      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, ''),
//      body: SingleChildScrollView(
//        child: Container(
//          padding: EdgeInsets.all(10),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              // car model
//              Text(
//                'Buik 1970',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 14,
//                ),
//              ),
//              // owner
//              Row(
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.all(5.0),
//                    child: Container(
//                      height: 20,
//                      width: 20,
//                      child: CircleAvatar(
//                        radius: 20,
//                        backgroundImage: NetworkImage(
//                            'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 10,
//                  ),
//                  Text(
//                    'Atrium k',
//                    style: TextStyle(
//                      fontSize: 12,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ],
//              ),
//              // car image
//              Container(
//                width: width,
//                height: 150,
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        fit: BoxFit.fill,
//                        image: NetworkImage(
//                            'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg'))),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  FlatButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(5)),
//                    color: ProjectColors.THEME_COLOR,
//                    onPressed: () {},
//                    child: Flex(
//                      direction: Axis.horizontal,
//                      children: [
//                        Icon(
//                          Icons.picture_in_picture,
//                          color: Colors.white,
//                        ),
//                        Text(
//                          'Show Pics',
//                          style: TextStyle(color: Colors.white),
//                        )
//                      ],
//                    ),
//                  )
//                ],
//              ),
//
//              //car details
//              Text('Type : Muscle Car'),
//              Text('Brand : Buik'),
//              Text('Traveled Distance : 13000 KM'),
//              Text('Dureation of use : 1 Year & 3 Months'),
//              Text('Gear Type : Manual'),
//              Text('CC : 5735 CC'),
//              Text('Cylynder : V8'),
//              Text('Fuel : Benzene'),
//              Text('Location : 326P+9Q Besiktas, Istanbul, Turkey'),
//              Text('Plated'),
//              Center(
//                child: Text('Price : 300,253 \$'),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: [
//                  FlatButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(5)),
//                    color: ProjectColors.THEME_COLOR,
//                    onPressed: () {},
//                    child: Text(
//                      'Request Lawer',
//                      style: TextStyle(fontSize: 10, color: Colors.white),
//                    ),
//                  ),
//                  FlatButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(5)),
//                    color: ProjectColors.THEME_COLOR,
//                    onPressed: () {},
//                    child: Text(
//                      'Request Chat',
//                      style: TextStyle(fontSize: 10, color: Colors.white),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
