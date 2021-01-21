
import 'package:hersay/module_products/repository/real_estate/real_estate.repository.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:inject/inject.dart';

@provide
class RealEstateManager{
  final RealEstateRepository _repository;

  RealEstateManager(
      this._repository,
      );

  Future<bool> addNewRealEstate(RealEstateRequest realEstateRequest) async => _repository.addNewRealEstate(realEstateRequest);
}