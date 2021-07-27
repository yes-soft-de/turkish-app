
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_history/model/history/history_model.dart';
import 'package:hersay/module_history/ui/screen/history/history_screen.dart';
import 'package:hersay/module_history/ui/widget/history_card/history_card.dart';


abstract class HistoryState {
  final HistoryScreenState screenState;

  HistoryState(this.screenState);

  Widget getUI(BuildContext context);
}

class HistoryStateInit extends HistoryState {
  HistoryStateInit(HistoryScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('Welcome to History Screen'),
    );
  }
}

class HistoryStateLoading extends HistoryState {
  HistoryStateLoading(HistoryScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HistoryStateUnauthorized extends HistoryState {
  HistoryStateUnauthorized(HistoryScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HistoryStateDataLoaded extends HistoryState {
  List<HistoryModel> historyItems = [];

  HistoryStateDataLoaded(this.historyItems, HistoryScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        screenState.getHistory();
        return Future.delayed(Duration(seconds: 3));
      },
      child:ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: HistoryCard(
                product: historyItems[index].itemName,
                date: historyItems[index].date,
                operationType:  historyItems[index].state,
              ),
            );
          }),


    );
  }


}

class HistoryStateError extends HistoryState {
  final String errorMsg;

  HistoryStateError(this.errorMsg, HistoryScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}