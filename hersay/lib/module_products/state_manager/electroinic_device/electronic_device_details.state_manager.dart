
import 'package:hersay/module_products/service/electronic_device/electronic_device.service.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/state/electronic_device_details/electronic_device_details.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ElectronicDeviceDetailsStateManager{
  final ElectronicDeviceService _electronicDeviceService;
  final PublishSubject<ElectronicDeviceDetailsState> _stateSubject = new PublishSubject();
  Stream<ElectronicDeviceDetailsState>  get stateStream => _stateSubject.stream;

  ElectronicDeviceDetailsStateManager(
      this._electronicDeviceService,
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

}