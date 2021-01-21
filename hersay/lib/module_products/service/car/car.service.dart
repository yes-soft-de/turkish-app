
import 'package:hersay/module_products/manager/car/car.manager.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:inject/inject.dart';

@provide
class CarService{
  final CarManager _manager;

  CarService(
      this._manager,
      );



  Future<bool> addNewCar(
  String brand,
  String company,
  String engine,
  int price,
  String description,
  String distance,
  String carType,
  String gearType,
  String cc,
  String fuel,
  String location,
  String yearOfRelease,
  String image,
  String country,
  String city,
  String state,
  String status,
      ) async {

    var carRequest = CarRequest(
      yearOfRelease: yearOfRelease,
      brand: brand,
      image: image,
      city: city,
      status: status,
      price: price,
      description: description,
      country: country,
      state: state,
      carType: carType,
      cc: cc,
      company: company,
      distance: distance,
      engine: engine,
      fuel: fuel,
      gearType: gearType,
      location: location,
    );
    return _manager.addNewCar(carRequest);
  }

}