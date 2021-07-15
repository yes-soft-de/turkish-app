
import 'package:hersay/module_reaction/repository/reaction.repository.dart';
import 'package:hersay/module_reaction/request/reaction_request.dart';
import 'package:inject/inject.dart';

@provide
class ReactionManager{
  final ReactionRepository _repository;

  ReactionManager(
      this._repository,
      );

  Future<bool> react(ReactionRequest request)async => _repository.react(request);
  Future<bool> deleteReact(ReactionRequest request)async => _repository.deleteReact(request);
}