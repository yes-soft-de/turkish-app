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
  ServiceDetailsStateInit(ServiceDetailsScreenState screenState)
      : super(screenState);

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
  ServiceDetailsStateDataLoaded(
      this.service, this.comments, ServiceDetailsScreenState screenState)
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
        backgroundColor: ProjectColors.THEME_COLOR,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.report),
            onPressed: () {
              screenState.report(service.type);
            },
          ),
          service.editable
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ProductsRoutes.ADD_SERVICE_SCREEN,
                        arguments: service);
                  },
                )
              : Container(),
        ],
      ),
      body: RefreshIndicator(
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
                    borderRadius: BorderRadius.circular(10),
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
                          '${service.title}',
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
                                  NetworkImage('${service.userImage}'),
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
                    service.isLoved
                        ? IconButton(
                            onPressed: () {
                              screenState.unLoveService(service);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              screenState.loveService(service);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: ProjectColors.THEME_COLOR,
                            ),
                          ),
                  ],
                ),

                // owner

                // service image
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

                //service details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).category + ' : ${service.type}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).country + ' : ${service.country}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(S.of(context).city + ' : ${service.city}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      S.of(context).descriptio + ' : ${service.description}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: ProjectColors.THEME_COLOR,
                      onPressed: () {
                        screenState.getRoomId(service.type);
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
                        screenState.getRoomIdWithLawyer(service.type);
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
                            onPressed: _comment.text.isNotEmpty
                                ? () {
                                    screenState.placeComment(_comment.text,
                                        '${service.type}', service.id);
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
