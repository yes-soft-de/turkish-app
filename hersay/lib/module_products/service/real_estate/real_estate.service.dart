
import 'package:hersay/module_products/manager/real_estate/real_estate.manager.dart';
import 'package:hersay/module_products/model/real_estate/real_estate_model.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/response/real_estate/real_estate_response.dart';
import 'package:inject/inject.dart';

@provide
class RealEstateService{
  final RealEstateManager _manager;

  RealEstateService(
      this._manager,
      );



  Future<bool> addNewRealEstate(
  String country,
  String city,
  String space,
  int price,
  String description,
  String image,
  String numberOfFloors,
  String cladding,
  String homeFurnishing,
  String realEstateType,
  String rooms,
  String status,
  String state,) async {

    var realEstateRequest = RealEstateRequest(
       image: image,
      city: city,
      status: status,
      price: price,
      description: description,
      cladding: cladding,
      country: country,
      homeFurnishing: homeFurnishing,
      numberOfFloors: numberOfFloors,
      realEstateType: realEstateType,
      rooms: realEstateType,
      space: space,
      state: state,
    );
    return _manager.addNewRealEstate(realEstateRequest);
  }

  Future<RealEstateModel> getRealEstateDetails(int realEstateId)async{
    RealEstateResponse response = await _manager.getRealEstateDetails(realEstateId);
    if(response == null) return null;



    return new RealEstateModel(
       price: response.data.price.toString(),
      description: response.data.description,
      type: response.data.realEstateType,
      space: response.data.space,
      cladding: response.data.cladding,
      //TODO : change this after been added to the response
      address: '',
      floorsNumber: response.data.numberOfFloors,
      isFurnished: response.data.homeFurnishing,
      image: response.data.image,
    );

  }
}