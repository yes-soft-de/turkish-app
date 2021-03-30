
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
  List<String> otherImages,
      AddCarScreenState screenState) {
    _stateSubject.add(AddCarStateLoading(screenState));
    _service
        .addNewCar(brand,company,engine,price,description,distance,carType,gearType,
    cc,fuel,location,yearOfRelease,image,country, city,state,status,otherImages)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(AddCarSuccessState(screenState));
      } else {
        _stateSubject
            .add(AddCarErrorState('Error Creating Order', screenState));
      }
    });
  }
  
}