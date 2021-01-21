
import 'package:hersay/module_products/repository/electonic_device/electronic_device.repository.dart';
import 'package:hersay/module_products/repository/real_estate/real_estate.repository.dart';
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:inject/inject.dart';

@provide
class ElectronicDeviceManager{
  final ElectronicDeviceRepository _repository;

  ElectronicDeviceManager(
      this._repository,
      );

  Future<bool> addNewElectronicDevice(ElectronicDeviceRequest electronicDeviceRequest) async =>
      _repository.addNewElectronicDevice(electronicDeviceRequest);
}