import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/response/category/category.dart';
import 'package:hersay/module_localization/persistance/localization_prefrences_helper.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/request/service/service_request.dart';
import 'package:hersay/module_products/response/real_estate/real_estate_response.dart';
import 'package:hersay/module_products/response/service/service_response.dart';
import 'package:inject/inject.dart';

LocalizationPreferencesHelper localizationPreferencesHelper =
    LocalizationPreferencesHelper();

@provide
class ServiceRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ServiceRepository(
    this._apiClient,
    this._authService,
  );

  Future<int> addNewService(ServiceRequest serviceRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
      Urls.ADD_NEW_SERVICE,
      serviceRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return null;

    return response['status_code'] == '201' ? response['Data']['id'] : null;
  }

  Future<int> updateService(ServiceRequest serviceRequest) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(
      Urls.UPDATE_SERVICE,
      serviceRequest.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );

    if (response == null) return null;

    return response['status_code'] == '204' ? response['Data']['id'] : null;
  }

  Future<ServiceResponse> getServiceDetails(int serviceId) async {
    var token = await _authService.getToken();
    dynamic response = (token != null)
        ? await _apiClient.get(
            Urls.SERVICE_DETAILS_API + '$serviceId',
            headers: {'Authorization': 'Bearer ' + token},
          )
        : await _apiClient.get(
            Urls.SERVICE_DETAILS_API + '$serviceId',
          );

    if (response == null) return null;
    return ServiceResponse.fromJson(response);
  }

  Future placeComment(CommentRequest request) async {
    var token = await _authService.getToken();
    var response = await _apiClient.post(
      Urls.COMMENT_API,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' + token},
    );
  }

  Future<CategoryResponse> getCategories() async {
    var token = await _authService.getToken();
    String language = await localizationPreferencesHelper.getLanguage();
    var response = await _apiClient
        .get(Urls.GET_CATEGORIES, headers: {'Local': language?? 'en'});
    return CategoryResponse.fromJson(response);
  }
}
