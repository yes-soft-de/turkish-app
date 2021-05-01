import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/service/car/car.service.dart';
import 'package:hersay/module_products/ui/screen/add_car/add_car_sceen.dart';
import 'package:hersay/module_products/ui/state/add_car/add_car.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AddCarStateManager {
  final CarService _service;
  final PublishSubject<AddCarState> _stateSubject = new PublishSubject();

  Stream<AddCarState> get stateStream => _stateSubject.stream;

  AddCarStateManager(this._service);

  void addNewCar(
      int price,
      String description,
      String distance,
      String carType,
      String gearType,
      String location,
      String yearOfRelease,
      String image,
      String country,
      String city,
      String status,
      List<String> otherImages,
      AddCarScreenState screenState) {
    _stateSubject.add(AddCarStateLoading(screenState));
    _service
        .addNewCar(price, description, distance, carType, gearType, location,
            yearOfRelease, image, country, city, status, otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddCarSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddCarErrorState('Error Creating Order', screenState));
      }
    });
  }

  void updateCar(
      int id,
      int price,
      String description,
      String distance,
      String carType,
      String gearType,
      String location,
      String yearOfRelease,
      String image,
      String country,
      String city,
      String status,
      List<String> otherImages,
      AddCarScreenState screenState) {
    _stateSubject.add(AddCarStateLoading(screenState));
    _service
        .updateCar(
            CarRequest(
              id: id,
              price: price,
              description: description,
              distance: distance,
              carType: carType,
              gearType: gearType,
              location: location,
              yearOfRelease: yearOfRelease,
              image: image,
              country: country,
              city: city,
              status: status,
            ),
            otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddCarSuccessState(screenState,'updated'));
      } else {
        _stateSubject
            .add(AddCarErrorState('Error updating Order', screenState));
      }
    });
  }
}
