
import 'package:hersay/module_products/manager/electronic_device/electronic_device.manager.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';
import 'package:inject/inject.dart';
import 'package:intl/intl.dart';

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

  Future<ElectronicDeviceModel> getElectronicDeviceDetails(int electronicDeviceId)async{
    ElectronicDeviceResponse response = await _manager.getElectronicDeviceDetails(electronicDeviceId);
    if(response == null) return null;

    var df = new DateFormat('yyyy');
    var date = new DateTime.fromMillisecondsSinceEpoch(response.data.yearOfRelease.timestamp *1000);


    return new ElectronicDeviceModel(
      type: response.data.type,
      //TODO : change this after been added to the response
      location: '',
      description: response.data.description,
      price: response.data.price.toString(),
      brand: response.data.brand,
      //TODO : change this after been added to the response
      graphics: '',
      processor: response.data.cpu,
      releaseYear: df.format(date).toString(),
      //TODO : change this after been added to the response
      storage: '',
      useDuration: response.data.durationOfUse,
      image: response.data.image,
    );

  }
}