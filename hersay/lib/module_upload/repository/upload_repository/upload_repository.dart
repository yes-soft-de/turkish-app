
import 'package:dio/dio.dart';
import 'package:hersay/consts/urls.dart';
import 'package:hersay/utils/logger/logger.dart';
import 'package:inject/inject.dart';

@provide
class UploadRepository {
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
}
