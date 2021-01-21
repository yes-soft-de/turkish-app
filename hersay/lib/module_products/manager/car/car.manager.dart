
import 'package:hersay/module_products/repository/car/car.repository.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:inject/inject.dart';

@provide
class CarManager{
  final CarRepository _repository;

  CarManager(
      this._repository,
      );

  Future<bool> addNewCar(CarRequest carRequest) async => _repository.addNewCar(carRequest);
}