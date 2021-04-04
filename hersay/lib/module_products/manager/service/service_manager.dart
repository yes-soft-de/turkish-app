
import 'package:hersay/module_products/repository/car/car.repository.dart';
import 'package:hersay/module_products/repository/service/service_repository.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:hersay/module_products/response/service/service_response.dart';
import 'package:inject/inject.dart';

@provide
class ServiceManager{
  final ServiceRepository _repository;

  ServiceManager(
      this._repository,
      );

  //Future<int> addNewCar(CarRequest carRequest) async => _repository.addNewCar(carRequest);

  Future<ServiceResponse> getServiceDetails(int serviceId) async => _repository.getServiceDetails(serviceId);
  Future placeComment(CommentRequest request)async => _repository.placeComment(request);

}