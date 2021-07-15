

import 'package:hersay/module_history/manager/history/history.manager.dart';
import 'package:hersay/module_history/model/history/history_model.dart';
import 'package:hersay/module_history/response/history/history_response.dart';
import 'package:inject/inject.dart';

@provide
class HistoryService{
  final HistoryManager _HistoryManager;

  HistoryService(
      this._HistoryManager,
      );

  Future<List<HistoryModel>> getHistory()async{
    HistoryResponse response = await _HistoryManager.getHistory();
    if(response == null) return null;

   return HistoryModel.getHistoryModelList(response);
  }
}