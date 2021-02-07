
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_report/ui/screen/report/report_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

abstract class ReportState {
  ReportScreenState screenState;

  ReportState(this.screenState);

  Widget getUI(BuildContext context);
}

class ReportStateLoading extends ReportState {
  ReportStateLoading(ReportScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ReportStateInit extends ReportState {

  ReportStateInit(ReportScreenState screenState) : super(screenState);


  final _reasonController = TextEditingController();

  @override
  Widget getUI(context) {

    return SingleChildScrollView(
      child:  Container(
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(S
                  .of(context)
                  .createReport, style: TextStyle(fontSize: 20),),
            ),
            Expanded(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return S
                            .of(context)
                            .reasonIsRequired;
                      }
                      return null;
                    },
                    controller: _reasonController,
                    decoration: InputDecoration(
                      hintText: S
                          .of(context)
                          .reasonOfTheReport,
                    ),
                    maxLines: 6,
                  ),
                ),
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 width: 100,
                 child: RaisedButton(
                     child: Text(
                       S
                           .of(context)
                           .cancel,
                       style: TextStyle(color: Colors.white),
                     ),
                     onPressed: () {
                       Navigator.of(context).pop();
                     }),
               ),
               Container(
                 width: 100,
                 child: RaisedButton(
                     color: ProjectColors.THEME_COLOR,
                     child: Text(
                       S
                           .of(context)
                           .save,
                       style: TextStyle(color: Colors.white),
                     ),
                     onPressed: () {
                       if (_reasonController.text.isNotEmpty) {
                         screenState.createReport(_reasonController.text);
                       } else {
                         Scaffold.of(context).showSnackBar(SnackBar(content: Text(S
                             .of(context)
                             .pleaseCompleteTheForm)));
                       }
                     }),
               ),
             ],
           ),
          ],
        ),
      ),
    );
  }

  Future<String> getClipBoardData() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    return data.text;
  }
}

class ReportSuccessState extends ReportState {
  ReportSuccessState(ReportScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: ProjectColors.THEME_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: 250,
                child: Text(
                  S.of(context).yourReportWasSentToTheAdmin,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.of(context).pop( );
            },
            child: Container(
              width: 175,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black45,
              ),
              child: Center(
                child: Text(
                  S.of(context).goBack,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class ReportErrorState extends ReportState {
  String errMsg;

  ReportErrorState(this.errMsg, ReportScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errMsg}'),
    );
  }
}
