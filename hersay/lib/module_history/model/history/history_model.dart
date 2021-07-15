 
import 'package:hersay/module_history/response/history/history_response.dart';
import 'package:intl/intl.dart';

class HistoryModel {
  String itemName;
  String state;
  String date;

  HistoryModel({
    this.itemName,
    this.date,
    this.state,
  });

  static List<HistoryModel> getHistoryModelList(HistoryResponse response){
    List<HistoryModel> HistoryItems = [];
    var df = DateFormat('dd-MM-yyyy hh:mm');
    response.data.forEach((element) {
      var date = new DateTime.fromMillisecondsSinceEpoch(element.date.timestamp * 1000);

      HistoryItems.add(
        new HistoryModel(
          date: df.format(date),
          itemName: element.itemName,
          state :element.state,
        )
      );
    });

    return HistoryItems;
  }
}
