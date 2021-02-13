
import 'package:dio/dio.dart';
import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_network/http_client/http_client.dart';
import 'package:hersay/utils/logger/logger.dart';
import 'package:inject/inject.dart';

@provide
class UploadRepository {
  final AuthService _authService;
  final ApiClient _apiClient;

  UploadRepository(
      this._apiClient,
      this._authService ,
      );

  Future<String> upload(String filePath) async {
    var client = Dio();
    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath),
    });

    Logger().info('image', 'Uploading: ' + filePath);

    Response response =
        await client.post(Urls.UPLOAD_FILE, data: data);
    Logger().info('Got a Response', response.toString());

    if (response == null) {
      return null;
    }

    return response.toString();
  }

   Future<bool> setImageToProduct(String imageUrl,int itemId, String entity)async{
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
        Urls.ADD_PRODUCT_IMAGE,
        {
          "image" :imageUrl,
          "entity" : entity,
          "itemID" : itemId
        },
       headers: {'Authorization':'Bearer '+token}
    );

    if(response == null) return false;
    return (response['status_code']) == '201' ? true : false;

   }
}
