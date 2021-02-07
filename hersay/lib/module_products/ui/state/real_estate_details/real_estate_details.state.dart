
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/real_estate/real_estate_model.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/real_estate_details/real_estate_details_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';



abstract class RealEstateDetailsState {
  final RealEstateDetailsScreenState screenState;

  RealEstateDetailsState(this.screenState);

  Widget getUI(BuildContext context);
}

class RealEstateDetailsStateInit extends RealEstateDetailsState {
  RealEstateDetailsStateInit(RealEstateDetailsScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to RealEstateDetails Screen'),
    );
  }
}

class RealEstateDetailsStateLoading extends RealEstateDetailsState {
  RealEstateDetailsStateLoading(RealEstateDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class RealEstateDetailsStateUnauthorized extends RealEstateDetailsState {
  RealEstateDetailsStateUnauthorized(RealEstateDetailsScreenState screenState)
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

class RealEstateDetailsStateDataLoaded extends RealEstateDetailsState {
  final RealEstateModel realEstate;

  RealEstateDetailsStateDataLoaded(this.realEstate, RealEstateDetailsScreenState screenState)
      : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
        onRefresh: () {
          screenState.getRealEstateDetails();
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
                      Icon(Icons.phone_iphone,color: Colors.white,),
                      SizedBox(width: 10,),
                      Center(
                        child:      Text(
                          '${realEstate.type}',
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
                                  '${realEstate.userImage}'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${realEstate.userName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),


                    realEstate.isLoved
                        ? Icon(
                      Icons.favorite,
                      color: ProjectColors.THEME_COLOR,
                    )
                        : IconButton(
                      onPressed: (){
                        screenState.loveRealEstate(realEstate);
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: ProjectColors.THEME_COLOR,
                      ),
                    ),
                  ],
                ),

                // House image
                Container(
                  width: width,
                  height: 150,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              realEstate.image?? 'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: ProjectColors.THEME_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              ProductsRoutes.PRODUCT_IMAGES,
                              arguments: realEstate.images
                          );
                        },
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

                //House details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).type+' ${realEstate.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).space+' ${realEstate.space} SM'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).floorsNumber+' ${realEstate.floorsNumber}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).cladding+' ${realEstate.cladding}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${realEstate.isFurnished}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).address+' ${realEstate.address}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).rooms+' ${realEstate.description}'),
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
                    child: Text(S.of(context).price+'${realEstate.price} \$'),
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

class RealEstateDetailsStateError extends RealEstateDetailsState {
  final String errorMsg;

  RealEstateDetailsStateError(this.errorMsg, RealEstateDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}