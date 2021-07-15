import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart' as mat;

abstract class AddCarState {
  AddCarScreenState screenState;

  AddCarState(this.screenState);

  Widget getUI(BuildContext context);
}

class AddCarStateLoading extends AddCarState {
  AddCarStateLoading(AddCarScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AddCarStateInit extends AddCarState {
  final GlobalKey<FormState> _addCarFormKey = GlobalKey<FormState>();

  final TextEditingController _carTypeController = TextEditingController();
  final TextEditingController _mileagesController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  List<String> _gearTypes = [S.current.manual, S.current.automatic];
  String _selectedGearType;

  String mainImage;
  List<String> otherImages = [];

  TextEditingController _dateController =
      TextEditingController(text: DateFormat('yyyy').format(DateTime.now()));
  String appBarTitle;
  bool _autoValidate = false;
  bool flag = true;
  AddCarStateInit(AddCarScreenState screenState) : super(screenState) {}
  DateTime _dateTime;
  @override
  Widget getUI(context) {
    final node = FocusScope.of(context);
    CarModel car = ModalRoute.of(context).settings.arguments;
    if (flag && car != null) {
      _descriptionController.text = car.discription;
      _carTypeController.text = car.type;
      _countryController.text = car.country;
      _cityController.text = car.city;
      _priceController.text = car.price;
      _locationController.text = car.location;
      _mileagesController.text = car.distance;
      _dateController.text = car.yearOfProdaction;
      _selectedGearType = car.gearType;
      _titleController.text = car.title;
      appBarTitle = S.of(context).updateCar;
      _dateTime = car.dateTime;
      flag = false;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: ProjectColors.THEME_COLOR,
        title: Text(
          appBarTitle ?? S.of(context).addNewCar,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addCarFormKey,
          autovalidate: _autoValidate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //title
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
                //car type
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
                      controller: _carTypeController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.directions_car),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: S.current.carType,
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
                      readOnly: true,
                      controller: _dateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: S.current.yearOfRelease,
                      ),
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate:
                                    car != null ? car.dateTime : DateTime.now(),
                                firstDate: DateTime.utc(1900, 1, 1),
                                lastDate: DateTime.now())
                            .then((value) {
                          _dateTime = value.toUtc();
                          _dateController.text =
                              DateFormat('yyyy').format(value.toUtc());
                          screenState.refresh();
                        });
                      },
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

                //Gear Type
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
                            hint: _selectedGearType == null
                                ? Text(
                                    S.of(context).gearType,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : Text(
                                    '$_selectedGearType',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                            //value: _selectedGearType,
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
                      controller: _mileagesController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.watch_later),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: S.of(context).mileages,
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
                        return null;
                      },
                    ),
                  ),
                ),
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
                          ip
                              .getImage(source: ImageSource.gallery)
                              .then((value) {
                            if (value != null) {
                              mainImage = value.path;
                              print('main image picked');
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
                          ip
                              .getImage(source: ImageSource.gallery)
                              .then((value) {
                            if (value != null) {
                              otherImages.add(value.path);
                              print(
                                  'another image picked, images length ${otherImages.length}');
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
                              S.of(context).addMoreImages,
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
                          if (_addCarFormKey.currentState.validate()) {
                            if (car != null) {
                              screenState.updateCar(
                                  car.id,
                                  _titleController.text.trim(),
                                  int.parse(_priceController.text.trim()),
                                  _descriptionController.text.trim(),
                                  _mileagesController.text.trim(),
                                  _carTypeController.text.trim(),
                                  _selectedGearType,
                                  _locationController.text.trim(),
                                  _dateTime?.toIso8601String() ??
                                      _dateController.text.trim() ??DateTime.now().toIso8601String(),
                                  mainImage ?? car.image ?? '',
                                  _countryController.text.trim(),
                                  _cityController.text.trim(),
                                  'not sold',
                                  otherImages);
                            } else {
                              screenState.addNewCar(
                                  _titleController.text.trim(),
                                  int.parse(_priceController.text.trim()),
                                  _descriptionController.text.trim(),
                                  _mileagesController.text.trim(),
                                  _carTypeController.text.trim(),
                                  _selectedGearType,
                                  _locationController.text.trim(),
                                  _dateTime?.toIso8601String() ??
                                      _dateController.text.trim() ?? DateTime.now().toIso8601String(),
                                  mainImage,
                                  _countryController.text.trim(),
                                  _cityController.text.trim(),
                                  'not sold',
                                  otherImages);
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
      ),
    );
  }

  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}

class AddCarSuccessState extends AddCarState {
  final message;
  AddCarSuccessState(AddCarScreenState screenState, [this.message])
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
