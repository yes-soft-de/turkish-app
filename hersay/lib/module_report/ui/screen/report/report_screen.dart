import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_report/state_manager/report.state_manager.dart';
import 'package:hersay/module_report/ui/state/report/report.state.dart';
import 'package:hersay/utils/report_helper/report_helper.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ReportScreen extends StatefulWidget {
  final ReportStateManager _stateManager;

  ReportScreen(
      this._stateManager,
      );

  @override
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {
  ReportHelper _report ;

  ReportState currentState;

  @override
  void initState() {
    super.initState();
    currentState = ReportStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event ;
      if (mounted) {
        setState(() {});
      }
    });
  }

  void createReport(String reason){
    widget._stateManager.createReport(_report.itemId, _report.entity, reason, this);
  }

  @override
  Widget build(BuildContext context) {
    _report = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, S
            .of(context)
            .report),
        body: currentState.getUI(context),
    );
  }
}
