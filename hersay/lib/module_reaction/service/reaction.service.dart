

import 'package:hersay/module_reaction/manager/reaction.manager.dart';
import 'package:hersay/module_reaction/request/reaction_request.dart';
import 'package:inject/inject.dart';

@provide
class ReactionService{
  final ReactionManager _manager;

  ReactionService(
      this._manager,
      );

  Future<bool> react(String entity,int itemId)async{
    ReactionRequest request = new ReactionRequest(
      itemID: itemId,
      type: 3,
      entity: entity
    );

    return _manager.react(request);
  }
}