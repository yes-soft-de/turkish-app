
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/service/electronic_device/electronic_device.service.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/state/electronic_device_details/electronic_device_details.state.dart';
import 'package:hersay/module_reaction/service/reaction.service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ElectronicDeviceDetailsStateManager{
  final ElectronicDeviceService _electronicDeviceService;
  final ChatService _chatService;
  final ReactionService _reactionService;
  final PublishSubject<ElectronicDeviceDetailsState> _stateSubject = new PublishSubject();
  Stream<ElectronicDeviceDetailsState>  get stateStream => _stateSubject.stream;

  ElectronicDeviceDetailsStateManager(
      this._electronicDeviceService,
      this._chatService,
      this._reactionService,
      );

  void getElectronicDeviceDetails(ElectronicDeviceDetailsScreenState screenState,int electronicDeviceId){
    _stateSubject.add(ElectronicDeviceDetailsStateLoading(screenState));
    _electronicDeviceService.getElectronicDeviceDetails(electronicDeviceId).then((value) {
      if (value == null) {
        _stateSubject
            .add(ElectronicDeviceDetailsStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(value, screenState));
      }
    });
  }

  void getRoomId(int itemId,ElectronicDeviceDetailsScreenState screenState){

    _chatService.getRoomId('device', itemId).then((value) {
      if(value != null){
        screenState.goToChat(value);
      }
    });
  }

  void loveDevice(int deviceId,ElectronicDeviceDetailsScreenState screenState,ElectronicDeviceModel device){

    _reactionService.react('device', deviceId).then((value) {
      if(value ){
          device.isLoved = true ;
        _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(device, screenState));
      }
    });
  }
}