
import 'package:hersay/module_products/manager/electronic_device/electronic_device.manager.dart';
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:inject/inject.dart';

@provide
class ElectronicDeviceService{
  final ElectronicDeviceManager _manager;

  ElectronicDeviceService(
      this._manager,
      );



  Future<bool> addNewElectronicDevice(
  String country,
  String brand,
  String type,
  String cpu,
  String ram,
  String battery,
  String price,
  String yearOfRelease,
  String description,
  String gauge,
  String city,
  String durationOfUse,
  String image,
  String state,
  String status,
      ) async {

    var electronicDeviceRequest = ElectronicDeviceRequest(
      state: state,
      country: country,
      description: description,
      price: price,
      status: status,
      city: city,
      image: image,
      type: type,
      battery: battery,
      brand: brand,
      cpu: cpu,
      durationOfUse: durationOfUse,
      gauge: gauge,
      ram: ram,
      yearOfRelease: yearOfRelease
    );
    return _manager.addNewElectronicDevice(electronicDeviceRequest);
  }

}