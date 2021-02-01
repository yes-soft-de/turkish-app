
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';



abstract class ProfileState {
  final ProfileScreenState screenState;

  ProfileState(this.screenState);

  Widget getUI(BuildContext context);
}

class ProfileStateInit extends ProfileState {
  ProfileStateInit(ProfileScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3L3H3l0sputiPxI2VL4XSLHfBo1qgmJlabw&usqp=CAU'),
                      fit: BoxFit.cover)),

            ),
            Container(
              height: 50,
              color: ProjectColors.SECONDARY_COLOR,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Zolfekar Seleten',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: ProjectColors.SECONDARY_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              color: Colors.black12,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).editAccount,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'edit4',
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.edit,
                            color: ProjectColors.SECONDARY_COLOR,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileStateLoading extends ProfileState {
  ProfileStateLoading(ProfileScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ProfileStateUnauthorized extends ProfileState {
  ProfileStateUnauthorized(ProfileScreenState screenState)
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

class ProfileStateDataLoaded extends ProfileState {
  final ProfileModel profileData;
  int selectedMode = 1;
  List<ProfileElement> displayedProducts = [];

  ProfileStateDataLoaded(this.profileData, ProfileScreenState screenState  )
      : super(screenState){
     displayedProducts = profileData.realEstates + profileData.cars + profileData.electronicDevices;
  }
  @override
  Widget getUI(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:(profileData.userImage!= null)?
                          NetworkImage(profileData.userImage )
                          :AssetImage('assets/images/profilePic.jpg'),
                      fit: BoxFit.fill)),

            ),
            Container(
              height: 75,
              color: ProjectColors.SECONDARY_COLOR,
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(bottom: 5,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   '${ profileData.userName}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(
                          context,
                          ProfileRoutes.EDIT_PROFILE_SCREEN,
                          arguments: '${profileData.userName}'
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.edit,
                        color:ProjectColors.THEME_COLOR,
                      ),
                    ),
                  ),

                ],
              ),
            ),



            Stack(
              children: [
                displayedProducts.isNotEmpty
                    ? Container(
                  margin: EdgeInsets.only(top: 80),
                  child: ListView.builder(
                    shrinkWrap: true,
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
                )
                :Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Center(
                    child:Text(
                      'You did not upload any products of this type yet'
                    )
                  ),
                ),

                Positioned(
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  child: Container(
                    color: Colors.black12,
                    margin: EdgeInsets.only(top: 0,bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        GestureDetector(
                          onTap: (){
                            displayedProducts =  profileData.cars + profileData.realEstates + profileData.electronicDevices;
                            selectedMode = 1;
                            screenState.refresh();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (selectedMode == 1)
                                  ? ProjectColors.SECONDARY_COLOR
                                  :ProjectColors.THEME_COLOR,
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
                          onTap: (){
                            displayedProducts = profileData.realEstates;
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
                                  :ProjectColors.THEME_COLOR,
                            ),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            displayedProducts = profileData.cars;
                            selectedMode = 3;
                            screenState.refresh();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(55),
                              color: (selectedMode == 3)
                                  ? ProjectColors.SECONDARY_COLOR
                                  :ProjectColors.THEME_COLOR,
                            ),
                            child: Icon(
                              Icons.directions_car,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            displayedProducts = profileData.electronicDevices;
                            selectedMode = 4;
                            screenState.refresh();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (selectedMode == 4)
                                  ? ProjectColors.SECONDARY_COLOR
                                  :ProjectColors.THEME_COLOR,
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
          ],
        ),
      ),
    );
  }


}

class ProfileStateError extends ProfileState {
  final String errorMsg;

  ProfileStateError(this.errorMsg, ProfileScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}