import 'package:flutter/cupertino.dart';
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:hersay/module_products/service/electronic_device/electronic_device.service.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/module_products/ui/state/add_electronic_device/add_electronic_device.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AddElectronicDeviceStateManager {
  final ElectronicDeviceService _service;
  final PublishSubject<AddElectronicDeviceState> _stateSubject =
      new PublishSubject();

  Stream<AddElectronicDeviceState> get stateStream => _stateSubject.stream;

  AddElectronicDeviceStateManager(this._service);

  void addNewElectronicDevice(
      String title,
      String country,
      String brand,
      String type,
      int price,
      String description,
      String city,
      String mainImage,
      String state,
      String status,
      List<String> otherImages,
      AddElectronicDeviceScreenState screenState) {
    _stateSubject.add(AddElectronicDeviceStateLoading(screenState));
    _service
        .addNewElectronicDevice(title,country, brand, type, price, description, city,
            mainImage, state, status, otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddElectronicDeviceSuccessState(screenState));
      } else {
        _stateSubject.add(
            AddElectronicDeviceErrorState('Error Creating Order', screenState));
      }
    });
  }

  void updateElectronicDevice(
      int id,
      String title,
      String country,
      String brand,
      String type,
      int price,
      String description,
      String city,
      String mainImage,
      String state,
      String status,
      List<String> otherImages,
      AddElectronicDeviceScreenState screenState) {
    _stateSubject.add(AddElectronicDeviceStateLoading(screenState));
    _service
        .updateElectronicDevice(
            ElectronicDeviceRequest(
              id: id,
              title: title,
              price: price,
              description: description,
              state: state,
              image: mainImage,
              brand: brand,
              type: type,
              country: country,
              city: city,
              status: status,
            ),
            otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject
            .add(AddElectronicDeviceSuccessState(screenState, 'update'));
      } else {
        _stateSubject.add(
            AddElectronicDeviceErrorState('Error updating Order', screenState));
      }
    });
  }
}
