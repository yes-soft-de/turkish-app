
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/service/car/car.service.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/state/car_details/car_details.state.dart';
import 'package:hersay/module_reaction/service/reaction.service.dart';
import 'package:hersay/module_report/service/report_service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class CarDetailsStateManager{
  final CarService _carService;
  final ChatService _chatService;
  final ReactionService _reactionService;
  final ReportService _reportService;
  final PublishSubject<CarDetailsState> _stateSubject = new PublishSubject();
  Stream<CarDetailsState>  get stateStream => _stateSubject.stream;

  CarDetailsStateManager(
      this._carService,
      this._chatService,
      this._reactionService,
      this._reportService,
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

  void getRoomId(int itemId,CarDetailsScreenState screenState){

    _chatService.getRoomId('car', itemId).then((value) {
      if(value != null){
        screenState.goToChat(value);
      }
    });
  }
  void getRoomIdWithLawyer(int itemId,CarDetailsScreenState screenState){

    _chatService.getRoomIdWithLawyer('car', itemId).then((value) {
      if(value != null){
        screenState.goToChat(value);
      }
    });
  }
  void loveCar(int carId,CarDetailsScreenState screenState,CarModel car){
    
    _reactionService.react('car', carId).then((value) {
      if(value ){
         car.isLoved = true ;
        _stateSubject.add(CarDetailsStateDataLoaded(car, screenState));
      }
    });
  }
  void unLoveCar(int carId,CarDetailsScreenState screenState,CarModel car){

    _reactionService.deleteReact('car', carId).then((value) {
      if(value ){
        car.isLoved = false ;
        _stateSubject.add(CarDetailsStateDataLoaded(car, screenState));
      }
    });
  }




}