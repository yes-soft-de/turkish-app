

import 'package:hersay/module_reaction/manager/reaction.manager.dart';
import 'package:hersay/module_reaction/request/reaction_request.dart';
import 'package:inject/inject.dart';

@provide
class ReactionService{
  final ReactionManager _manager;

  ReactionService(
      this._manager,
      );

  Future<void> react(String entity,int itemId)async{
    ReactionRequest request = new ReactionRequest(
      itemID: itemId,
      type: 1,
      entity: entity
    );

    return _manager.react(request);
  }
}