import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/model/service/service.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/service_details/service_details.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

abstract class ServicesDetailsState {
  final ServiceDetailsScreenState screenState;

  ServicesDetailsState(this.screenState);

  Widget getUI(BuildContext context);
}

class ServiceDetailsStateInit extends ServicesDetailsState {
  ServiceDetailsStateInit(ServiceDetailsScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to ServiceDetails Screen'),
    );
  }
}

class ServiceDetailsStateLoading extends ServicesDetailsState {
  ServiceDetailsStateLoading(ServiceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ServiceDetailsStateUnauthorized extends ServicesDetailsState {
  ServiceDetailsStateUnauthorized(ServiceDetailsScreenState screenState)
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

class ServiceDetailsStateDataLoaded extends ServicesDetailsState {
  final ServiceModel service;
  final List<Widget> comments;
  ServiceDetailsStateDataLoaded(this.service,this.comments,ServiceDetailsScreenState screenState)
      : super(screenState);
  TextEditingController _comment = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () {
        screenState.getServiceDetails();
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
                      Icons.design_services,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        '${service.type}',
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
                            backgroundImage: NetworkImage('${service.userImage}'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${service.userName}',
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
                  // service.isLoved
                  //     ? IconButton(
                  //         onPressed: () {
                  //           screenState.unLoveCar(service);
                  //         },
                  //         icon: Icon(
                  //           Icons.favorite,
                  //           color: ProjectColors.THEME_COLOR,
                  //         ),
                  //       )
                  //     : IconButton(
                  //         onPressed: () {
                  //           screenState.loveCar(service);
                  //         },
                  //         icon: Icon(
                  //           Icons.favorite_border,
                  //           color: ProjectColors.THEME_COLOR,
                  //         ),
                  //       ),
                
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
                        image: NetworkImage(service.image ??
                            'https://www.wsupercars.com/wallpapers/Buick/1970-Buick-GSX-001-1080.jpg'))),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       FlatButton(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5)),
              //         //TODO : change this
              //         color: ProjectColors.THEME_COLOR,
              //         onPressed: () {
              //           Navigator.pushNamed(
              //               context, ProductsRoutes.PRODUCT_IMAGES,
              //               arguments: service.images);
              //         },
              //         child: Flex(
              //           direction: Axis.horizontal,
              //           children: [
              //             Icon(
              //               Icons.picture_in_picture,
              //               color: Colors.white,
              //             ),
              //             SizedBox(
              //               width: 5,
              //             ),
              //             Text(
              //               S.of(context).showPics,
              //               style: TextStyle(color: Colors.white),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              //car details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).type + ' ${service.type}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).title + ' : ${service.title}'),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:
              //       Text(S.of(context).dureationOfUse + ' ${car.useDuration}'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(S.of(context).cylynder + ' ${car.cylinder}'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(S.of(context).location + ' : ${service.address}'),
              // ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(S.of(context).descriptio + ' : ${service.description}'),
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
                  child: Text(S.of(context).price + '  ${service.price} \$'),
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
                                _comment.text, 'car', service.id);
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

class ServiceDetailsStateError extends ServicesDetailsState {
  final String errorMsg;

  ServiceDetailsStateError(this.errorMsg, ServiceDetailsScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
