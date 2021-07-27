import 'package:inject/inject.dart';
import 'package:hersay/module_upload/repository/upload_repository/upload_repository.dart';

@provide
class UploadManager {
  final UploadRepository _repository;
  UploadManager(this._repository);

  Future<String> upload(String filePath) {
    return _repository.upload(filePath);
  }

  Future<bool> setImageToProduct(String imageUrl, int itemId, String entity) async =>
      _repository.setImageToProduct(imageUrl, itemId, entity);

}
