import 'package:hersay/module_report/manager/report_manager.dart';
import 'package:hersay/module_report/request/report_request.dart';
import 'package:inject/inject.dart';

@provide
class ReportService {
  final ReportManager _manager;
  ReportService(this._manager);

  Future<dynamic> createReport(int itemId,String entity, String reason) {
    return _manager.createReport(ReportRequest(
      entity: entity,
      itemID: itemId,
      reason: reason,
    ));
  }
}