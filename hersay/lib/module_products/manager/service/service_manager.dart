
import 'package:hersay/module_products/repository/car/car.repository.dart';
import 'package:hersay/module_products/repository/service/service_repository.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/request/service/service_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:hersay/module_products/response/service/service_response.dart';
import 'package:inject/inject.dart';

@provide
class ServiceManager{
  final ServiceRepository _repository;

  ServiceManager(
      this._repository,
      );
      
  Future<ServiceResponse> getServiceDetails(int serviceId) async => _repository.getServiceDetails(serviceId);
  Future<int> addNewService(ServiceRequest serviceRequest) async => _repository.addNewService(serviceRequest);
  Future<int> updateService(ServiceRequest serviceRequest) async => _repository.updateService(serviceRequest);
  Future placeComment(CommentRequest request)async => _repository.placeComment(request);
  Future getCategories()async => _repository.getCategories();


}