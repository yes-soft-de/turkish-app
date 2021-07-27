
import 'package:hersay/module_report/service/report_service.dart';
import 'package:hersay/module_report/ui/screen/report/report_screen.dart';
import 'package:hersay/module_report/ui/state/report/report.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ReportStateManager {
  final ReportService _service;
  final PublishSubject<ReportState> _stateSubject = new PublishSubject();

  Stream<ReportState> get stateStream => _stateSubject.stream;

  ReportStateManager(this._service);

  void createReport(
  int itemId,
  String entity,
  String reason,

      ReportScreenState screenState) {
    _stateSubject.add(ReportStateLoading(screenState));
    _service
        .createReport(itemId, entity, reason)
        .then((newProduct) {
      if (newProduct) {
        _stateSubject.add(ReportSuccessState(screenState));
      } else {
        _stateSubject
            .add(ReportErrorState('Error Creating Order', screenState));
      }
    });
  }
}