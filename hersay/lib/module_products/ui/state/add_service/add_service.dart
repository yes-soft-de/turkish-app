import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_products/model/service/service.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/screen/add_service/add_service_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddServiceState {
  AddServiceScreenState screenState;

  AddServiceState(this.screenState);

  Widget getUI(BuildContext context);
}

class AddServiceStateLoading extends AddServiceState {
  AddServiceStateLoading(AddServiceScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AddServiceStateInit extends AddServiceState {
  final GlobalKey<FormState> _addServiceFormKey = GlobalKey<FormState>();

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final List<Categories> categories;
  String mainImage;
  List<String> otherImages = [];

  TextEditingController _dateController;

  bool _autoValidate = false;
  List<String> categoriesList = [];
  String _selectedCategoryType;
  int categoryID;
  bool flag = true;
  AddServiceStateInit(AddServiceScreenState screenState, this.categories)
      : super(screenState) {
    var startDate = new DateTime.utc(1900, 1, 1);
    _dateController = TextEditingController(text: startDate.toString());
    _dateController.text = startDate.toString();
    categories.forEach((element) {
      categoriesList.add(element.categoryName);
    });
  }
  String title;
  @override
  Widget getUI(context) {
    ServiceModel service = ModalRoute.of(context).settings.arguments;
    if (service != null && flag) {
      categoryID = service.categoryId;
      _selectedCategoryType = service.categoryName;
      _typeController.text = service.type;
      _titleController.text = service.title;
      _descriptionController.text = service.description;
      _cityController.text = service.city;
      _countryController.text = service.country;
      title = S.of(context).updateService;
      flag = false;
    }
    final node = FocusScope.of(context);

    return Scaffold(
           appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: ProjectColors.THEME_COLOR,
        title: Text(
          title??S.of(context).addNewService,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
      child: Form(
        key: _addServiceFormKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 340,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint:
                              /*_selectedEntityType == null
                              ?*/
                              Text(
                            S.of(context).chooseCategory,
                            style: TextStyle(color: Colors.grey),
                          )
                          /* : Text(
                            '$_selectedEntityType',
                            style: TextStyle(color: Colors.grey),
                          )*/
                          ,
                          value: _selectedCategoryType,
                          items: categoriesList.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedCategoryType = value;
                            categories.forEach((element) {
                              if (element.categoryName == value) {
                                categoryID = element.categoryId;
                              }
                            });
                            screenState.refresh();
                          }),
                    ),
                  )),

              //service category
              // Card(
              //   elevation: 10,
              //   margin: EdgeInsets.only(top: 20),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15)),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.black12,
              //     ),
              //     child: TextFormField(
              //       controller: _typeController,
              //       decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.design_services),
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         labelText: S.current.category,
              //       ),
              //       textInputAction: TextInputAction.next,
              //       onEditingComplete: () => node.nextFocus(),
              //       // Move focus to next
              //       validator: (result) {
              //         if (result.isEmpty) {
              //           return S.of(context).thisFieldCannotBeEmpty;
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),

              //service title
              Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.current.title,
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              //location

              Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.current.country,
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.current.city,
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                ),
              ),

              // description
              Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).descriptio,
                    ),
                    textInputAction: TextInputAction.newline,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 55,
                  margin: EdgeInsets.only(top: 30),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        ImagePicker ip = ImagePicker();
                        ip.getImage(source: ImageSource.gallery).then((value) {
                          if (value != null) {
                            mainImage = value.path;
                          }
                        });
                      },
                      color: ProjectColors.SECONDARY_COLOR,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_library,
                            color: Colors.white,
                          ),
                          Text(
                            S.of(context).selectMainImage,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
              // Center(
              //   child: Container(
              //     width: 250,
              //     height: 55,
              //     margin: EdgeInsets.only(top: 30),
              //     child: FlatButton(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         onPressed: () {
              //           ImagePicker ip = ImagePicker();
              //           ip.getImage(source: ImageSource.gallery).then((value) {
              //             if (value != null) {
              //               otherImages.add(value.path);
              //               print(
              //                   'another image picked, images length ${otherImages.length}');
              //             }
              //           });
              //         },
              //         color: ProjectColors.SECONDARY_COLOR,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(
              //               Icons.photo_library,
              //               color: Colors.white,
              //             ),
              //             Text(
              //               S.of(context).addMoreImages,
              //               style: TextStyle(color: Colors.white),
              //             ),
              //           ],
              //         )),
              //   ),
              // ),

              Center(
                child: Container(
                  width: 200,
                  height: 55,
                  margin: EdgeInsets.only(top: 30),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        if (_addServiceFormKey.currentState.validate()) {
                          if (service != null) {
                            screenState.updateService(
                                service.id,
                                categoryID,
                                _cityController.text.trim(),
                                _countryController.text.trim(),
                                _titleController.text.trim(),
                                _typeController.text.trim(),
                                _descriptionController.text.trim(),
                                mainImage ?? service.image ?? '');
                          } else {
                            screenState.addNewService(
                              categoryID,
                              _cityController.text.trim(),
                              _countryController.text.trim(),
                              _titleController.text.trim(),
                              _typeController.text.trim(),
                              _descriptionController.text.trim(),
                              mainImage,
                            );
                          }
                        }
                      },
                      //TODO : change this using theme service
                      color: ProjectColors.SECONDARY_COLOR,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          Text(
                            S.of(context).save,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    )
  ,
    );
  }

  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}

class AddServiceSuccessState extends AddServiceState {
  final String message;
  AddServiceSuccessState(AddServiceScreenState screenState, [this.message])
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: ProjectColors.THEME_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: 250,
                child: Text(
                  message != null
                      ? S.of(context).updatedSuccessfully
                      : S.of(context).yourRequestHasBeenAddedAndInHoldForAdmin,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainRoutes.MAIN_SCREEN_ROUTE,
                (r) => false,
              );
            },
            child: Container(
              width: 175,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black45,
              ),
              child: Center(
                child: Text(
                  S.of(context).backToHome,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddServiceErrorState extends AddServiceState {
  String errMsg;

  AddServiceErrorState(this.errMsg, AddServiceScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errMsg}'),
    );
  }
}
