import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/service/real_estate/real_estate.service.dart';
import 'package:hersay/module_products/ui/screen/add_real_estate/add_real_estate_screen.dart';
import 'package:hersay/module_products/ui/state/add_real_estate/add_real_estate.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AddRealEstateStateManager {
  final RealEstateService _service;
  final PublishSubject<AddRealEstateState> _stateSubject = new PublishSubject();

  Stream<AddRealEstateState> get stateStream => _stateSubject.stream;

  AddRealEstateStateManager(this._service);

  void addNewRealEstate(
      String title,
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String homeFurnishing,
      String realEstateType,
      String status,
      String mainImage,
      List<String> otherImages,
      AddRealEstateScreenState screenState) {
    _stateSubject.add(AddRealEstateStateLoading(screenState));
    _service
        .addNewRealEstate(
            title,
            country,
            city,
            space,
            price,
            description,
            numberOfFloors,
            homeFurnishing,
            realEstateType,
            status,
            mainImage,
            otherImages)
        .then((newOrder) {
      if (newOrder) {
        _stateSubject.add(AddRealEstateSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddRealEstateErrorState('Error Creating Order', screenState));
      }
    });
  }

  void updateRealEstate(
      int id,
      String title,
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String homeFurnishing,
      String realEstateType,
      String status,
      String mainImage,
      List<String> otherImages,
      AddRealEstateScreenState screenState) {
    _stateSubject.add(AddRealEstateStateLoading(screenState));
    _service
        .updateRealEstate(
            RealEstateRequest(
                id: id,
                title: title,
                price: price,
                description: description,
                image: mainImage,
                country: country,
                city: city,
                status: status,
                realEstateType: realEstateType,
                homeFurnishing: homeFurnishing,
                numberOfFloors: numberOfFloors,
                space: space),
            otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddRealEstateSuccessState(screenState, 'update'));
      } else {
        _stateSubject
            .add(AddRealEstateErrorState('Error updating Order', screenState));
      }
    });
  }
}
