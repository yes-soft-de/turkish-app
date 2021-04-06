import 'package:flutter/material.dart';
import 'package:hersay/module_chat/service/chat/char_service.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/model/service/service.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/service/service/service.dart';
import 'package:hersay/module_products/ui/screen/car_details/car_details_screen.dart';
import 'package:hersay/module_products/ui/screen/service_details/service_details.dart';
import 'package:hersay/module_products/ui/state/service_details/service_details.dart';
import 'package:hersay/module_products/ui/widgets/commentCard.dart';
import 'package:hersay/module_reaction/service/reaction.service.dart';
import 'package:hersay/module_report/service/report_service.dart';
import 'package:inject/inject.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ServicesDetailsStateManager {
  final ServiceService _serviceService;
  final ChatService _chatService;
  final ReactionService _reactionService;
  final ReportService _reportService;
  final PublishSubject<ServicesDetailsState> _stateSubject = new PublishSubject();
  Stream<ServicesDetailsState> get stateStream => _stateSubject.stream;

  ServicesDetailsStateManager(
    this._serviceService,
    this._chatService,
    this._reactionService,
    this._reportService,
  );

  void getServicesDetails(ServiceDetailsScreenState screenState, int serviceId) {
    _stateSubject.add(ServiceDetailsStateLoading(screenState));
    _serviceService.getServiceDetails(serviceId).then((value) {
      if (value == null) {
        _stateSubject
            .add(ServiceDetailsStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(ServiceDetailsStateDataLoaded(value,getComments(value) ,screenState));
      }
    });
  }

  void getRoomId(int itemId,String type,ServiceDetailsScreenState screenState) {
    _chatService.getRoomId(type, itemId).then((value) {
      if (value != null) {
        screenState.goToChat(value);
      }
    });
  }

  void getRoomIdWithLawyer(int itemId, String type,ServiceDetailsScreenState screenState) {
    _chatService.getRoomIdWithLawyer(type, itemId).then((value) {
      if (value != null) {
        screenState.goToChat(value);
      }
    });
  }

  void loveService(int serviceId, ServiceDetailsScreenState screenState, ServiceModel service) {
    _reactionService.react(service.type, serviceId).then((value) {
      if (value) {
        service.isLoved = true;
        _stateSubject.add(ServiceDetailsStateDataLoaded(service,getComments(service),screenState));
      }
    });
  }

  void unLoveService(int serviceId, ServiceDetailsScreenState screenState, ServiceModel service) {
    _reactionService.deleteReact(service.type, serviceId).then((value) {
      if (value) {
        service.isLoved = false;
        _stateSubject.add(ServiceDetailsStateDataLoaded(service,getComments(service),screenState));
      }
    });
  }

  void placeComment(String comment, String entity, int itemId,
      ServiceDetailsScreenState screenState) {
    //_stateSubject.add(CarDetailsStateLoading(screenState));
    _serviceService
        .placeComment(CommentRequest(itemId, entity, comment))
        .whenComplete(() {
      _serviceService.getServiceDetails(itemId).then((value) {
        if (value == null) {
          _stateSubject.add(ServiceDetailsStateError(
              'Error Finding Data', screenState));
        } else {
          _stateSubject.add(ServiceDetailsStateDataLoaded(
              value, getComments(value), screenState));
        }
      });
    });
  }

  List<Widget> getComments(ServiceModel service) {
    List<Widget> comments = [];
    var df = DateFormat('yyyy/MM/dd');
    service.comments.forEach((element) {
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
