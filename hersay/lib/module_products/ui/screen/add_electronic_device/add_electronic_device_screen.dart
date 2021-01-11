import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class AddElectronicDeviceScreen extends StatefulWidget {
  @override
  _AddElectronicDeviceScreenState createState() =>
      _AddElectronicDeviceScreenState();
}

class _AddElectronicDeviceScreenState extends State<AddElectronicDeviceScreen> {
  final GlobalKey<FormState> _addCarFormKey = GlobalKey<FormState>();

  final TextEditingController _DeviceTypeController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _useDurationController = TextEditingController();
  final TextEditingController _guageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<String> _deviceTypes = ['Sell Phone', 'Laptop', 'Desktop', 'Headphone'];
  String _selectedDeviceType;

  TextEditingController _dateController;

  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    var startDate = new DateTime.utc(1900, 1, 1);
    _dateController = TextEditingController(text: startDate.toString());
    _dateController.text = startDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi() {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(
          context, 'Add Electronic Device'),
      body: SingleChildScrollView(
        child: Form(
          key: _addCarFormKey,
          autovalidate: _autoValidate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //device type
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
                            hint: _selectedDeviceType == null
                                ? Text(
                                    'Device Type',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : Text(
                                    '$_selectedDeviceType',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                            items: _deviceTypes.map((String place) {
                              return new DropdownMenuItem<String>(
                                value: place.toString(),
                                child: new Text(place),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedDeviceType = _deviceTypes.firstWhere(
                                    (element) => element.toString() == value);
                              });
                            }),
                      ),
                    )),
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
                          node.nextFocus(), // Move focus to next
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

                // use duration
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
                      controller: _useDurationController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.watch_later),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Use Duration',
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          node.nextFocus(), // Move focus to next
                      validator: (result) {
                        if (result.isEmpty) {
                          return 'الرجاء ادخال اسمك';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                // guage
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
                      controller: _guageController,
                      decoration: InputDecoration(
//                        prefixIcon: Icon(Icons.hors),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Guage',
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          node.nextFocus(), // Move focus to next
                      validator: (result) {
                        if (result.isEmpty) {
                          return 'الرجاء ادخال اسمك';
                        }
                        return null;
                      },
                    ),
                  ),
                ),

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
                          node.nextFocus(), // Move focus to next
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
                          node.nextFocus(), // Move focus to next
                      validator: (result) {
                        if (result.isEmpty) {
                          return 'الرجاء ادخال اسمك';
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
      ),
    );
  }
}
