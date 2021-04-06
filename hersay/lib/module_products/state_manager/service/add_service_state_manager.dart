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

  void addNewService(String type, String title, String description,
      String image, AddServiceScreenState screenState) {
    _stateSubject.add(AddServiceStateLoading(screenState));
    _service
        .addNewService(ServiceRequest(
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

  void updateService(int id, String type, String title, String description,
      String image, AddServiceScreenState screenState) {
    _stateSubject.add(AddServiceStateLoading(screenState));
    _service
        .updateService(ServiceRequest(
            id: id,
            type: type,
            title: title,
            description: description,
            image: image))
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddServiceSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddServiceErrorState('Error updating Order', screenState));
      }
    });
  }
}
