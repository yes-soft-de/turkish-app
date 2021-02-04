
import 'package:hersay/module_reaction/repository/reaction.repository.dart';
import 'package:hersay/module_reaction/request/reaction_request.dart';
import 'package:inject/inject.dart';

@provide
class ReactionManager{
  final ReactionRepository _repository;

  ReactionManager(
      this._repository,
      );

  Future<void> react(ReactionRequest request)async => _repository.react(request);
}