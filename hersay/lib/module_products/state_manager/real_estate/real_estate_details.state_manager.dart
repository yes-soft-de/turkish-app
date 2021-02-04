
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/service/real_estate/real_estate.service.dart';
import 'package:hersay/module_products/ui/screen/real_estate_details/real_estate_details_screen.dart';
import 'package:hersay/module_products/ui/state/real_estate_details/real_estate_details.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class RealEstateDetailsStateManager{
  final RealEstateService _realEstateService;
  final ChatService _chatService;
  final PublishSubject<RealEstateDetailsState> _stateSubject = new PublishSubject();
  Stream<RealEstateDetailsState>  get stateStream => _stateSubject.stream;

  RealEstateDetailsStateManager(
      this._realEstateService,
      this._chatService,
      );

  void getRealEstateDetails(RealEstateDetailsScreenState screenState,int realEstateId){
    _stateSubject.add(RealEstateDetailsStateLoading(screenState));
    _realEstateService.getRealEstateDetails(realEstateId).then((value) {
      if (value == null) {
        _stateSubject
            .add(RealEstateDetailsStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(RealEstateDetailsStateDataLoaded(value, screenState));
      }
    });
  }
  void getRoomId(int itemId,RealEstateDetailsScreenState screenState){

    _chatService.getRoomId('realEstate', itemId).then((value) {
      if(value != null){
        screenState.goToChat(value);
      }
    });
  }
}