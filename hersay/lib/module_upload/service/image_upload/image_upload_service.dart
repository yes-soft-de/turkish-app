import 'package:inject/inject.dart';
import 'package:hersay/module_upload/manager/upload_manager/upload_manager.dart';
import 'package:hersay/module_upload/response/imgbb/imgbb_response.dart';

@provide
class ImageUploadService {
  final UploadManager manager;

  ImageUploadService(this.manager);

  Future<String> uploadImage(String filePath) async {
    print('qqq  image upload service runing');
    String response = await manager.upload(filePath);
    if (response == null) {
      return null;
    } else {
      print('qqq image uploaded url: ${response}');
      return response;
    }
  }

  Future<List<String>> uploadMultipleImages(List<String> filePaths) async {


    List<String> list = await Future.wait(filePaths.map((filePath) => manager.upload(filePath)));

    return list;
  }

  Future<void> setImagesToProduct(List<String> imagesUrls,String entity,int itemId)async{

    List<bool> list = await Future.wait(imagesUrls.map((imageUrl) => manager.setImageToProduct(imageUrl,itemId,entity)));

    return list.map((response){
      (response == null)? false: response;
    }).toList();
  }

}
