
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

class AddRealEstateStateInit extends AddRealEstateState {

  final GlobalKey<FormState> _addRealEstateFormKey = GlobalKey<FormState>();

  final TextEditingController _realEstateTypeController = TextEditingController();
  final TextEditingController _spaceController = TextEditingController();
  final TextEditingController _floorNumbersController = TextEditingController();
  final TextEditingController _claddingController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _roomsNumberController = TextEditingController();

  List<String> _houseTypes = [
    'furnished',
    'unfurnished',
  ];
  String _selectedHouseType;

  String mainImage;

  bool _autoValidate = false;

  AddRealEstateStateInit(  AddRealEstateScreenState screenState)
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _realEstateTypeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Real Estate Type',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _spaceController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Space',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _floorNumbersController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Appartment Floor or Number of Floors',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _claddingController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Cladding',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                  width: 400,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius:
                            2.0, // has the effect of softening the shadow
                            spreadRadius:
                            2.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: _selectedHouseType == null
                              ? Text(
                            'Home Furmishing',
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
              // country
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Country',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'City',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Price',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      if(!isNumeric(result)){
                        return S.of(context).youCanUseOnlyNumbers;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // rooms number
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _roomsNumberController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Rooms number',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      if(!isNumeric(result)){
                        return S.of(context).youCanUseOnlyNumbers;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // description
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                          2.0, // has the effect of softening the shadow
                          spreadRadius:
                          2.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ]),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Rooms description',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(), // Move focus to next
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
                  width: 200,
                  height: 55,
                  margin: EdgeInsets.only(top: 30),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {

                          ImagePicker ip = ImagePicker();
                          ip
                              .getImage(source: ImageSource.gallery)
                              .then((value) {
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
                            'upload Pics',
                            style: TextStyle(color: Colors.white),
                          )
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
                            'Unaccepted',
                            mainImage,
                        );
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
                            'Save',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              'your request has been added and in hold for admin approval'
            ),
          ),
        ),


          RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(24),
                  onPressed: () {

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      MainRoutes.MAIN_SCREEN_ROUTE,
                          (r) => false,
                    );
                  },
                  child: Expanded(
                    child: Text(
                      'Ok',
                    ),
                  ),
                ),


      ],
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