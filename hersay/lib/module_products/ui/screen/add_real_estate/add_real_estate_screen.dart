
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_products/state_manager/real_estate/add_real_estate.manager.dart';
import 'package:hersay/module_products/ui/state/add_real_estate/add_real_estate.state.dart';
import 'package:inject/inject.dart';

import '../../../products_routes.dart';

@provide
class AddRealEstateScreen extends StatefulWidget {
  final AddRealEstateStateManager _stateManager;
  final AuthService _authService;

  AddRealEstateScreen(
      this._stateManager,
      this._authService,
      );

  @override
   AddRealEstateScreenState createState() =>  AddRealEstateScreenState();
}

class  AddRealEstateScreenState extends State<AddRealEstateScreen> {
  AddRealEstateState currentState;

  @override
  void initState() {
    super.initState();
    currentState = AddRealEstateStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }

  void refresh() {
    setState(() {});
  }

  void addNewRealEstate(
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String cladding,
      String homeFurnishing,
      String realEstateType,
      String rooms,
      String status,
      String state,
      String mainImage){
    widget._stateManager.addNewRealEstate(country,city,space,price,description,
        numberOfFloors,cladding,homeFurnishing,realEstateType,rooms,status,state,mainImage, this);
  }

  @override
  Widget build(BuildContext context) {
    widget._authService.isLoggedIn.then((value){
      if(!value) {
        Navigator.of(context).pushNamed(
            AuthorizationRoutes.LOGIN_SCREEN,
            arguments: ProductsRoutes.ADD_REAL_ESTATE_SCREEN
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: currentState.getUI(context),
      ),
    );
  }



//  Widget _screenUi() {
//    final node = FocusScope.of(context);
//
//    return Scaffold(
//      appBar:
//          TurkishAppBar.getTurkishOrdinaryAppBar(context, 'Add Real Estate'),
//      body: SingleChildScrollView(
//        child: Form(
//          key: _addRealEstateFormKey,
//          autovalidate: _autoValidate,
//          child: Container(
//            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                //real estate type
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _realEstateTypeController,
//                      decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.home),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Real Estate Type',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                // Space
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _spaceController,
//                      decoration: InputDecoration(
////                        prefixIcon: Icon(Icons.),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Space',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                //build year
//                Container(
//                  padding: EdgeInsets.all(5),
//                  margin: EdgeInsets.only(top: 30),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    padding: EdgeInsets.symmetric(horizontal: 10),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: DateTimePicker(
//                      type: DateTimePickerType.date,
//                      dateMask: 'yyyy',
//                      initialValue: DateTime.now().toString(),
//                      firstDate: DateTime.utc(1900, 1, 1),
//                      lastDate: DateTime(2100),
////                         icon: Icon(Icons.event),
//                      dateLabelText: 'Year of release',
//
//                      selectableDayPredicate: (date) {
//                        // Disable weekend days to select from the calendar
////                             if (date.weekday == 6 || date.weekday == 7) {
////                               return false;
////                             }
//
//                        return true;
//                      },
//                      onChanged: (val) => print(val),
//                      validator: (val) {
//                        print(val);
//                        return null;
//                      },
//                      onSaved: (val) => print(val),
//                    ),
//                  ),
//                ),
//
//                // floor number
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _floorNumbersController,
//                      decoration: InputDecoration(
////                        prefixIcon: Icon(Icons.hors),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Appartment Floor or Number of Floors',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                // cladding
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _claddingController,
//                      decoration: InputDecoration(
////                        prefixIcon: Icon(Icons.hors),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Cladding',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                //home furnishing
//                Container(
//                    width: 400,
//                    margin: EdgeInsets.only(top: 15),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white),
//                    child: Container(
//                      padding: EdgeInsets.symmetric(horizontal: 10),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(15),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius:
//                                  2.0, // has the effect of softening the shadow
//                              spreadRadius:
//                                  2.0, // has the effect of extending the shadow
//                              offset: Offset(
//                                5.0, // horizontal, move right 10
//                                5.0, // vertical, move down 10
//                              ),
//                            )
//                          ]),
//                      child: DropdownButtonHideUnderline(
//                        child: DropdownButton(
//                            hint: _selectedHouseType == null
//                                ? Text(
//                                    'Home Furmishing',
//                                    style: TextStyle(color: Colors.grey),
//                                  )
//                                : Text(
//                                    '$_selectedHouseType',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                            items: _houseTypes.map((String place) {
//                              return new DropdownMenuItem<String>(
//                                value: place.toString(),
//                                child: new Text(place),
//                              );
//                            }).toList(),
//                            onChanged: (value) {
//                              setState(() {
//                                _selectedHouseType = _houseTypes.firstWhere(
//                                    (element) => element.toString() == value);
//                              });
//                            }),
//                      ),
//                    )),
//                // location
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _locationController,
//                      decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.location_on),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Location',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                // price
//                Container(
//                  height: 55,
//                  margin: EdgeInsets.only(top: 15),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.black12,
//                            blurRadius:
//                                2.0, // has the effect of softening the shadow
//                            spreadRadius:
//                                2.0, // has the effect of extending the shadow
//                            offset: Offset(
//                              5.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          )
//                        ]),
//                    child: TextFormField(
//                      controller: _priceController,
//                      decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.attach_money),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                        labelText: 'Price',
//                      ),
//                      textInputAction: TextInputAction.next,
//                      onEditingComplete: () =>
//                          node.nextFocus(), // Move focus to next
//                      validator: (result) {
//                        if (result.isEmpty) {
//                          return 'الرجاء ادخال اسمك';
//                        }
//                        return null;
//                      },
//                    ),
//                  ),
//                ),
//                Center(
//                  child: Container(
//                    width: 200,
//                    height: 55,
//                    margin: EdgeInsets.only(top: 30),
//                    child: FlatButton(
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(10),
//                        ),
//                        onPressed: () {},
//                        color: ProjectColors.SECONDARY_COLOR,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Icon(
//                              Icons.photo_library,
//                              color: Colors.white,
//                            ),
//                            Text(
//                              'upload Pics',
//                              style: TextStyle(color: Colors.white),
//                            )
//                          ],
//                        )),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
}
