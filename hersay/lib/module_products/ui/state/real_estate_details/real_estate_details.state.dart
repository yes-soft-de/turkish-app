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
  RealEstateDetailsStateInit(RealEstateDetailsScreenState screenState)
      : super(screenState);

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
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class RealEstateDetailsStateDataLoaded extends RealEstateDetailsState {
  final RealEstateModel realEstate;
  final List<Widget> comments;
  RealEstateDetailsStateDataLoaded(
      this.realEstate, this.comments, RealEstateDetailsScreenState screenState)
      : super(screenState);
  TextEditingController _comment = TextEditingController();
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () {
        screenState.getRealEstateDetails();
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
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 50,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
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
                            backgroundImage:
                                NetworkImage('${realEstate.userImage}'),
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
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    //TODO : change this
                    color: ProjectColors.THEME_COLOR,
                    onPressed: () {
                      screenState.report();
                    },
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.report_problem,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).report,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  realEstate.isLoved
                      ? IconButton(
                          onPressed: () {
                            screenState.unLoveRealEstate(realEstate);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: ProjectColors.THEME_COLOR,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
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
                        fit: BoxFit.cover,
                        image: NetworkImage(realEstate.image ??
                            'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg'))),
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
                            context, ProductsRoutes.PRODUCT_IMAGES,
                            arguments: realEstate.images);
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

              //House details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).type + ' ${realEstate.type}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).space + ' : ${realEstate.space} SM'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    S.of(context).floorsNumber + ' ${realEstate.floorsNumber}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${realEstate.isFurnished}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).address + ' ${realEstate.address}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).roomsDescription + ' : ${realEstate.description}'),
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
                  child: Text(S.of(context).price + '  ${realEstate.price} \$'),
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
                            color: Colors.white,
                          ),
                          onPressed: () {
                            screenState.placeComment(
                                _comment.text, 'realEstate', realEstate.id);
                          }),
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
                padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
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
    );
  }
}

class RealEstateDetailsStateError extends RealEstateDetailsState {
  final String errorMsg;

  RealEstateDetailsStateError(
      this.errorMsg, RealEstateDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
