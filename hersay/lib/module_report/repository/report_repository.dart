

import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_report/request/report_request.dart';
import 'package:inject/inject.dart';

@provide
class ReportRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ReportRepository(this._apiClient, this._authService);

  Future<bool> createReport(ReportRequest request) async {

    var token = await _authService.getToken();

    dynamic response = await _apiClient.post(Urls.REPORT_API, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if(response == null )return false;
    return (response['status_code']=='201')? true : false;
  }
}