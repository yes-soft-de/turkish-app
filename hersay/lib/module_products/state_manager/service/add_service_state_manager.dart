import 'package:hersay/module_products/request/service/service_request.dart';
import 'package:hersay/module_products/service/service/service.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/screen/add_service/add_service_screen.dart';
import 'package:hersay/module_products/ui/state/add_car/add_car.state.dart';
import 'package:hersay/module_products/ui/state/add_service/add_service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AddServiceStateManager {
  final ServiceService _service;
  final PublishSubject<AddServiceState> _stateSubject = new PublishSubject();

  Stream<AddServiceState> get stateStream => _stateSubject.stream;

  AddServiceStateManager(this._service);

  void addNewService(int id,String city,String country,String type, String title, String description,
      String image, AddServiceScreenState screenState) {
    _stateSubject.add(AddServiceStateLoading(screenState));
    _service
        .addNewService(ServiceRequest(categoryID: id,
        city: city,
        country: country,
            type: type, title: title, description: description, image: image))
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddServiceSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddServiceErrorState('Error Creating Order', screenState));
      }
    });
  }

  void updateService(int id,int catId ,String city,String country,String type, String title, String description,
      String image, AddServiceScreenState screenState) {
    _stateSubject.add(AddServiceStateLoading(screenState));
    _service
        .updateService(ServiceRequest(
            id: id,
            categoryID: catId,
            city: city,
            country: country,
            type: type,
            title: title,
            description: description,
            image: image))
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddServiceSuccessState(screenState, 'updated'));
      } else {
        _stateSubject
            .add(AddServiceErrorState('Error updating Order', screenState));
      }
    });
  }

  void getCategory(AddServiceScreenState screenState) {
    _stateSubject.add(AddServiceStateLoading(screenState));
    _service.getCategories().then((value) {
      if (value != null) {
        _stateSubject.add(AddServiceStateInit(screenState,value));
      } else {
        _stateSubject.add(AddServiceErrorState('Error Fetching categories', screenState));
      }
    });
  }
}
