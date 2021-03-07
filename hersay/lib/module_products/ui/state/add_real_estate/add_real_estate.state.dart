import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_products/ui/screen/add_real_estate/add_real_estate_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validators/validators.dart';

abstract class AddRealEstateState {
  AddRealEstateScreenState screenState;

  AddRealEstateState(this.screenState);

  Widget getUI(BuildContext context);
}
class AddRealEstateStateLoading extends AddRealEstateState {
  AddRealEstateStateLoading(AddRealEstateScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AddRealEstateStateInit extends AddRealEstateState {
  final GlobalKey<FormState> _addRealEstateFormKey = GlobalKey<FormState>();

  final TextEditingController _realEstateTypeController =
      TextEditingController();
  final TextEditingController _spaceController = TextEditingController();
  final TextEditingController _floorNumbersController = TextEditingController();
  final TextEditingController _claddingController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _roomsNumberController = TextEditingController();

  List<String> _houseTypes = [
    S.current.furnished,
    S.current.unfurnished,
  ];
  String _selectedHouseType;

  List<String> _stateTypes = [S.current.accepted, S.current.unAccepted];
  String _selectedstate;

  String mainImage;
  List<String> otherImages = [];

  bool _autoValidate = false;

  AddRealEstateStateInit(AddRealEstateScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(context) {
    final node = FocusScope.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _addRealEstateFormKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //real estate type
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
                    controller: _realEstateTypeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).realEstateType,
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
              // Space
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
                    keyboardType: TextInputType.number,
                    controller: _spaceController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).space,
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

              // floor number
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
                    keyboardType: TextInputType.number,
                    controller: _floorNumbersController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).appartmentFloorOrNumberOfFloors,
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
              // cladding
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
                    controller: _claddingController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).cladding,
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
              //home furnishing
              Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: _selectedHouseType == null
                              ? Text(
                                  S.of(context).homeFurmishing,
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  '$_selectedHouseType',
                                  style: TextStyle(color: Colors.grey),
                                ),
                          items: _houseTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedHouseType = _houseTypes.firstWhere(
                                (element) => element.toString() == value);
                            screenState.refresh();
                          }),
                    ),
                  )),
              //state
              Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: _selectedstate == null
                              ? Text(
                                  S.of(context).state,
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  '$_selectedstate',
                                  style: TextStyle(color: Colors.grey),
                                ),
                          items: _stateTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedstate = _stateTypes.firstWhere(
                                (element) => element.toString() == value);
                            screenState.refresh();
                          }),
                    ),
                  )),
              // country
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
                      prefixIcon: Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).country,
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
              // city
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
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).city,
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
              // price
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
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).price,
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      if (!isNumeric(result)) {
                        return S.of(context).youCanUseOnlyNumbers;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // rooms number
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
                    keyboardType: TextInputType.number,
                    controller: _roomsNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).roomsNumber,
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      if (!isNumeric(result)) {
                        return S.of(context).youCanUseOnlyNumbers;
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
                      labelText: S.of(context).roomsDescription,
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
                            print('main image picked');
                          }
                        });
                      },
                      //TODO : change this using theme service
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
                          )
                        ],
                      )),
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
                            otherImages.add(value.path)  ;
                            print('another image picked, images length ${otherImages.length}');
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
                            S.of(context).addMoreImages ,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
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
                        if (_addRealEstateFormKey.currentState.validate()) {
                          screenState.addNewRealEstate(
                            _countryController.text.trim(),
                            _cityController.text.trim(),
                            _spaceController.text.trim(),
                            int.parse(_priceController.text.trim()),
                            _descriptionController.text.trim(),
                            _floorNumbersController.text.trim(),
                            _claddingController.text.trim(),
                            _selectedHouseType,
                            _realEstateTypeController.text.trim(),
                            _roomsNumberController.text.trim(),
                            'not sold',
                            _selectedstate,
                            mainImage,
                            otherImages,
                          );
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
    );
  }

  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}

class AddRealEstateSuccessState extends AddRealEstateState {
  AddRealEstateSuccessState(AddRealEstateScreenState screenState)
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
                  S.of(context).yourRequestHasBeenAddedAndInHoldForAdmin,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
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

class AddRealEstateErrorState extends AddRealEstateState {
  String errMsg;

  AddRealEstateErrorState(this.errMsg, AddRealEstateScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errMsg}'),
    );
  }
}
