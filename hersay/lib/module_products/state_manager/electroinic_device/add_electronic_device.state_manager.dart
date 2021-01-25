
import 'package:hersay/module_products/service/electronic_device/electronic_device.service.dart';
import 'package:hersay/module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart';
import 'package:hersay/module_products/ui/state/add_electronic_device/add_electronic_device.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AddElectronicDeviceStateManager {
  final ElectronicDeviceService _service;
  final PublishSubject<AddElectronicDeviceState> _stateSubject = new PublishSubject();

  Stream<AddElectronicDeviceState> get stateStream => _stateSubject.stream;

  AddElectronicDeviceStateManager(this._service);

  void addNewElectronicDevice(
      String country,
      String brand,
      String type,
      String cpu,
      String ram,
      String battery,
      int price,
      String yearOfRelease,
      String description,
      String gauge,
      String city,
      String durationOfUse,
      String image,
      String state,
      String status,
      AddElectronicDeviceScreenState screenState) {
    _service
        .addNewElectronicDevice(country, brand, type, cpu, ram, battery, price, yearOfRelease,
        description, gauge, city, durationOfUse, image, state, status)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddElectronicDeviceSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddElectronicDeviceErrorState('Error Creating Order', screenState));
      }
    });
  }
}