
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/model/real_estate/real_estate_model.dart';
import 'package:hersay/module_products/service/real_estate/real_estate.service.dart';
import 'package:hersay/module_products/ui/screen/real_estate_details/real_estate_details_screen.dart';
import 'package:hersay/module_products/ui/state/real_estate_details/real_estate_details.state.dart';
import 'package:hersay/module_reaction/service/reaction.service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class RealEstateDetailsStateManager{
  final RealEstateService _realEstateService;
  final ChatService _chatService;
  final ReactionService _reactionService;
  final PublishSubject<RealEstateDetailsState> _stateSubject = new PublishSubject();
  Stream<RealEstateDetailsState>  get stateStream => _stateSubject.stream;

  RealEstateDetailsStateManager(
      this._realEstateService,
      this._chatService,
      this._reactionService,
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
  void getRoomIdWithLawyer(int itemId,RealEstateDetailsScreenState screenState){

    _chatService.getRoomIdWithLawyer('realEstate', itemId).then((value) {
      if(value != null){
        screenState.goToChat(value);
      }
    });
  }

  void loveRealEstate(int deviceId,RealEstateDetailsScreenState screenState,RealEstateModel realEstate){

    _reactionService.react('realEstate', deviceId).then((value) {
      if(value ){
        realEstate.isLoved = true ;
        _stateSubject.add(RealEstateDetailsStateDataLoaded(realEstate, screenState));
      }
    });
  }

  void unLoveRealEstate(int deviceId,RealEstateDetailsScreenState screenState,RealEstateModel realEstate){

    _reactionService.deleteReact('realEstate', deviceId).then((value) {
      if(value ){
        realEstate.isLoved = false ;
        _stateSubject.add(RealEstateDetailsStateDataLoaded(realEstate, screenState));
      }
    });
  }
}