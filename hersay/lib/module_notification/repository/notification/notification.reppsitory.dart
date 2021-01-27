
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_notification/response/notification/notification_response.dart';
import 'package:inject/inject.dart';

@provide
class NotificationRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepository(
      this._authService,
      this._apiClient,
      );

  Future<NotificationResponse> getNotification()async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.NOTIFICATION,
        headers: {'Authorization':'Bearer '+token}
    );

    if(response == null) return null;

    return NotificationResponse.fromJson(response);
  }
}