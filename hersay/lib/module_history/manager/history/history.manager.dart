
import 'package:hersay/module_history/repository/history/history.reppsitory.dart';
import 'package:hersay/module_history/response/history/history_response.dart';
import 'package:inject/inject.dart';

@provide
class HistoryManager{
  final HistoryRepository _repository;

  HistoryManager(
      this._repository,
      );

  Future<HistoryResponse> getHistory()async => _repository.getHistory();
}