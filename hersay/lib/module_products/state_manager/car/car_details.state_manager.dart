
import 'package:hersay/module_products/service/car/car.service.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/state/car_details/car_details.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class CarDetailsStateManager{
  final CarService _carService;
  final PublishSubject<CarDetailsState> _stateSubject = new PublishSubject();
  Stream<CarDetailsState>  get stateStream => _stateSubject.stream;

  CarDetailsStateManager(
      this._carService,
      );

  void getCarDetails(CarDetailsScreenState screenState,int carId){
    _stateSubject.add(CarDetailsStateLoading(screenState));
    _carService.getCarDetails(carId).then((value) {
      if (value == null) {
        _stateSubject
            .add(CarDetailsStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(CarDetailsStateDataLoaded(value, screenState));
      }
    });
  }

}