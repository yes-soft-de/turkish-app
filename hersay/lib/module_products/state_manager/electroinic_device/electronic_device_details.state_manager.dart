import 'package:flutter/material.dart';
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/service/electronic_device/electronic_device.service.dart';
import 'package:hersay/module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart';
import 'package:hersay/module_products/ui/state/electronic_device_details/electronic_device_details.state.dart';
import 'package:hersay/module_products/ui/widgets/commentCard.dart';
import 'package:hersay/module_reaction/service/reaction.service.dart';
import 'package:inject/inject.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ElectronicDeviceDetailsStateManager {
  final ElectronicDeviceService _electronicDeviceService;
  final ChatService _chatService;
  final ReactionService _reactionService;
  final PublishSubject<ElectronicDeviceDetailsState> _stateSubject =
      new PublishSubject();
  Stream<ElectronicDeviceDetailsState> get stateStream => _stateSubject.stream;

  ElectronicDeviceDetailsStateManager(
    this._electronicDeviceService,
    this._chatService,
    this._reactionService,
  );

  void getElectronicDeviceDetails(
      ElectronicDeviceDetailsScreenState screenState, int electronicDeviceId) {
    _stateSubject.add(ElectronicDeviceDetailsStateLoading(screenState));
    _electronicDeviceService
        .getElectronicDeviceDetails(electronicDeviceId)
        .then((value) {
      if (value == null) {
        _stateSubject.add(ElectronicDeviceDetailsStateError(
            'Error Finding Data', screenState));
      } else {
        _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(
            value, getComments(value), screenState));
      }
    });
  }

  void placeComment(String comment, String entity, int itemId,
      ElectronicDeviceDetailsScreenState screenState) {
    //_stateSubject.add(ElectronicDeviceDetailsStateLoading(screenState));
    _electronicDeviceService
        .placeComment(CommentRequest(itemId, entity, comment))
        .whenComplete(() {
      _electronicDeviceService.getElectronicDeviceDetails(itemId).then((value) {
        if (value == null) {
          _stateSubject.add(ElectronicDeviceDetailsStateError(
              'Error Finding Data', screenState));
        } else {
          _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(
              value, getComments(value), screenState));
        }
      });
    });
  }

  void getRoomId(int itemId, ElectronicDeviceDetailsScreenState screenState) {
    _chatService.getRoomId('device', itemId).then((value) {
      if (value != null) {
        screenState.goToChat(value);
      }
    });
  }

  void getRoomIdWithLawyer(
      int itemId, ElectronicDeviceDetailsScreenState screenState) {
    _chatService.getRoomIdWithLawyer('device', itemId).then((value) {
      if (value != null) {
        screenState.goToChat(value);
      }
    });
  }

  void loveDevice(int deviceId, ElectronicDeviceDetailsScreenState screenState,
      ElectronicDeviceModel device) {
    _reactionService.react('device', deviceId).then((value) {
      if (value) {
        device.isLoved = true;
        _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(
            device, getComments(device), screenState));
      }
    });
  }

  void unLoveDevice(
      int deviceId,
      ElectronicDeviceDetailsScreenState screenState,
      ElectronicDeviceModel device) {
    _reactionService.deleteReact('device', deviceId).then((value) {
      if (value) {
        device.isLoved = false;
        _stateSubject.add(ElectronicDeviceDetailsStateDataLoaded(
            device, getComments(device), screenState));
      }
    });
  }

  List<Widget> getComments(ElectronicDeviceModel device) {
    List<Widget> comments = [];
    var df = DateFormat('yyyy/MM/dd');
    device.comments.forEach((element) {
      comments.add(CommentCard(
        userImage: element.image,
        userName: element.userName,
        commentText: element.comment,
        date: df
            .format(DateTime.fromMillisecondsSinceEpoch(
                element.createdAt.timestamp * 1000))
            .toString(),
      ));
    });
    return comments;
  }
}
