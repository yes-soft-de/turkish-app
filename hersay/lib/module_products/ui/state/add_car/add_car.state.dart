
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

abstract class AddCarState {
  AddCarScreenState screenState;

  AddCarState(this.screenState);

  Widget getUI(BuildContext context);
}

class AddCarStateInit extends AddCarState {

  final GlobalKey<FormState> _addCarFormKey = GlobalKey<FormState>();

  final TextEditingController _carTypeController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _mileagesController = TextEditingController();
  final TextEditingController _ccController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<String> _gearTypes = ['Manual', 'Automatic'];
  String _selectedGearType;
  List<String> _fuelsTypes = ['Benzene', 'Diesel'];
  String _selectedFuelType;

  TextEditingController _dateController;

  bool _autoValidate = false;

  AddCarStateInit(  AddCarScreenState screenState): super(screenState){

    var startDate = new DateTime.utc(1900, 1, 1);
    _dateController = TextEditingController(text: startDate.toString());
    _dateController.text = startDate.toString();
  }


  @override
  Widget getUI(context) {
    final node = FocusScope.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _addCarFormKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //car type
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
                    controller: _carTypeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.directions_car),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Car Type',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // Brand
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
                    controller: _brandController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.branding_watermark),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Brand',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              //build year
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime.utc(1900, 1, 1),
                    lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
                    dateLabelText: 'Year of release',

                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
//                             if (date.weekday == 6 || date.weekday == 7) {
//                               return false;
//                             }

                      return true;
                    },
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                ),
              ),

              //Gear Type
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
                          hint: _selectedGearType == null
                              ? Text(
                            'Gear Type',
                            style: TextStyle(color: Colors.grey),
                          )
                              : Text(
                            '$_selectedGearType',
                            style: TextStyle(color: Colors.grey),
                          ),
                          items: _gearTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedGearType = _gearTypes.firstWhere(
                                    (element) => element.toString() == value);
                            screenState.refresh();

                          }),
                    ),
                  )),
              // mileages
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
                    controller: _mileagesController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.watch_later),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Mileages',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // cc
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
                    controller: _ccController,
                    decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'CC',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // fuel
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
                          hint: _selectedGearType == null
                              ? Text(
                            'Fuel',
                            style: TextStyle(color: Colors.grey),
                          )
                              : Text(
                            '$_selectedFuelType',
                            style: TextStyle(color: Colors.grey),
                          ),
                          items: _fuelsTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedFuelType = _fuelsTypes.firstWhere(
                                    (element) => element.toString() == value);
                            screenState.refresh();
                          }),
                    ),
                  )),
              // location
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
                    controller: _locationController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Location',
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
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
                        node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return 'الرجاء ادخال اسمك';
                      }
                      return null;
                    },
                  ),
                ),
              ),


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
                      onPressed: () {},
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
              )
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

class AddCarSuccessState extends AddCarState {
  AddCarSuccessState(AddCarScreenState screenState)
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
                    //TODO : change it later to named route
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
//                    Navigator.of(context).pushNamedAndRemoveUntil(
//                      OrdersRoutes.OWNER_ORDERS_SCREEN,
//                          (r) => false,
//                    );
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

class AddCarErrorState extends AddCarState {
  String errMsg;

  AddCarErrorState(this.errMsg, AddCarScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errMsg}'),
    );
  }
}