import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_chat/chat_routes.dart';
import 'package:hersay/module_products/model/real_estate/real_estate_model.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/state_manager/real_estate/real_estate_details.state_manager.dart';
import 'package:hersay/module_products/ui/state/real_estate_details/real_estate_details.state.dart';
import 'package:hersay/module_report/report_routes.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/report_helper/report_helper.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class RealEstateDetailsScreen extends StatefulWidget {
  final RealEstateDetailsStateManager _stateManager;
  final AuthService _authService;
  
  RealEstateDetailsScreen(
      this._stateManager,
      this._authService,
      );
  
  @override
  RealEstateDetailsScreenState createState() => RealEstateDetailsScreenState();
}

class RealEstateDetailsScreenState extends State<RealEstateDetailsScreen> {
  RealEstateDetailsState currentState;
  int realEstateId = 0;
  
  double width;
 
  @override
  void initState() { 
    super.initState();
    currentState = RealEstateDetailsStateInit(this);
    widget._stateManager.stateStream.listen((event) { 
      currentState = event;
      if(this.mounted){
        setState(() {
          
        });
      }
    });
  }
void placeComment(String comment, String entity, int itemId) {
    widget._authService.isLoggedIn.then((value) {
      if (!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo: ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
            additionalData: realEstateId);
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      } else {
        widget._stateManager.placeComment(comment, entity, itemId, this);
      }
    });
  }
  void loveRealEstate(RealEstateModel realEstate){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: realEstateId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.loveRealEstate(realEstateId, this, realEstate);
      }
    });
  }

  void unLoveRealEstate(RealEstateModel realEstate){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.CAR_DETAILS_SCREEN,
            additionalData: realEstateId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.unLoveRealEstate(realEstateId, this, realEstate);
      }
    });
  }

  void getRealEstateDetails(){
    widget._stateManager.getRealEstateDetails(this, realEstateId)  ;
  }

  void getRoomId(){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
            additionalData: realEstateId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.getRoomId(realEstateId, this);
      }
    });
  }
  void getRoomIdWithLawyer(){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
            additionalData: realEstateId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        widget._stateManager.getRoomIdWithLawyer(realEstateId, this);
      }
    });
  }

  void report(){
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        RouteHelper redirectTo = new RouteHelper(
            redirectTo:  ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
            additionalData: realEstateId
        );
        Navigator.of(context).pushNamed(
          AuthorizationRoutes.LOGIN_SCREEN,
          arguments: redirectTo,
        );
      }else{
        ReportHelper report = new ReportHelper(
          entity: 'realEstate',
          itemId: realEstateId,
        );
        Navigator.of(context).pushNamed(
            ReportRoutes.REPORT_SCREEN,
            arguments: report
        );
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
    if (currentState is RealEstateDetailsStateInit) {
      realEstateId = ModalRoute.of(context).settings.arguments;
      getRealEstateDetails();
    }


    
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentState is RealEstateDetailsStateDataLoaded ? null : TurkishAppBar.getTurkishOrdinaryAppBar(context,  S.of(context).details),
      body: currentState.getUI(context),
    );
  }

  Widget _screenUi() {
    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, ''),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // car model
              Text(
                'House 44',
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
                    'Steve Josh',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // House image
              Container(
                width: width,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
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

              //House details
              Text('Type : House'),
              Text('Space : 250 SM'),
              Text('Floors number : 3'),
              Text('Cladding : Super Deluxe'),
              Text('Furnished House'),
              Text('Address :  Sisili, Istanbul, Turkey'),
              Text('Rooms : 3 Bathrooms, 5 Bedrooms and Carage'),
              Center(
                child: Text('Price : 300,253 \$'),
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
