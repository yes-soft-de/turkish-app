import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddElectronicDeviceState {
  AddElectronicDeviceScreenState screenState;

  AddElectronicDeviceState(this.screenState);

  Widget getUI(BuildContext context);
}

class AddElectronicDeviceStateLoading extends AddElectronicDeviceState {
  AddElectronicDeviceStateLoading(AddElectronicDeviceScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AddElectronicDeviceStateInit extends AddElectronicDeviceState {
  final GlobalKey<FormState> _addDeviceFormKey = GlobalKey<FormState>();

  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  TextEditingController _dateController;

  bool _autoValidate = false;

  String mainImage;
  List<String> otherImages = [];
  bool flag = true;
  AddElectronicDeviceStateInit(AddElectronicDeviceScreenState screenState)
      : super(screenState) {
    var startDate = new DateTime.utc(1900, 1, 1);
    _dateController = TextEditingController(text: startDate.toString());
    _dateController.text = startDate.toString();
  }

  @override
  Widget getUI(context) {
    final node = FocusScope.of(context);
    ElectronicDeviceModel device = ModalRoute.of(context).settings.arguments;

    if (flag && device != null) {
      _descriptionController.text = device.description;
      _countryController.text = device.country;
      _cityController.text = device.city;
      _priceController.text = device.price;
      _locationController.text = device.location;
      _brandController.text = device.brand;
      _typeController.text = device.type;
      flag = false;
    }
    return SingleChildScrollView(
      child: Form(
        key: _addDeviceFormKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //device type
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
                    controller: _typeController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).deviceType,
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
              // Brand
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
                    controller: _brandController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.branding_watermark),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).brand,
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
                        if (_addDeviceFormKey.currentState.validate()) {
                          if (device != null) {
                            screenState.updateElectronicDevice(
                                device.id,
                                _countryController.text.trim(),
                                _brandController.text.trim(),
                                _typeController.text.trim(),
                                int.parse(_priceController.text.trim()),
                                _descriptionController.text.trim(),
                                _cityController.text.trim(),
                                mainImage ?? device.image ?? '',
                                'not sold',
                                'Unaccepted',
                                otherImages);
                          } else {
                            screenState.addNewElectronicDevice(
                                _countryController.text.trim(),
                                _brandController.text.trim(),
                                _typeController.text.trim(),
                                int.parse(_priceController.text.trim()),
                                _descriptionController.text.trim(),
                                _cityController.text.trim(),
                                mainImage,
                                'not sold',
                                'Unaccepted',
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
    );
  }

  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}

class AddElectronicDeviceSuccessState extends AddElectronicDeviceState {
  final message;
  AddElectronicDeviceSuccessState(AddElectronicDeviceScreenState screenState,
      [this.message])
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

class AddElectronicDeviceErrorState extends AddElectronicDeviceState {
  String errMsg;

  AddElectronicDeviceErrorState(
      this.errMsg, AddElectronicDeviceScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errMsg}'),
    );
  }
}
