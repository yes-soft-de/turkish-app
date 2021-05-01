import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_products/manager/electronic_device/electronic_device.manager.dart';
import 'package:hersay/module_products/model/electronic_device/electronic_device_model.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/request/electonic_device/electronic_device_request.dart';
import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';
import 'package:intl/intl.dart';

@provide
class ElectronicDeviceService {
  final ElectronicDeviceManager _manager;
  final ImageUploadService _imageUploadService;

  ElectronicDeviceService(
    this._manager,
    this._imageUploadService,
  );

  Future<bool> addNewElectronicDevice(
    String country,
    String brand,
    String type,
    int price,
    String description,
    String city,
    String mainImagePath,
    String state,
    String status,
    List<String> otherImages,
  ) async {
    String uploadedImageUrl = (mainImagePath != null)
        ? await _imageUploadService.uploadImage(mainImagePath)
        : '';

    var electronicDeviceRequest = ElectronicDeviceRequest(
      state: state,
      country: country,
      description: description,
      price: price,
      status: status,
      city: city,
      image: uploadedImageUrl,
      type: type,
      brand: brand,
    );
    int result = await _manager.addNewElectronicDevice(electronicDeviceRequest);
    if (result != null) await _uploadOtherImages(otherImages, result);

    return result != null;
  }

  Future<void> _uploadOtherImages(List<String> filePaths, int itemId) async {
    List<String> imagesUrl =
        await _imageUploadService.uploadMultipleImages(filePaths);
    await _imageUploadService.setImagesToProduct(imagesUrl, 'device', itemId);
  }

  Future<ElectronicDeviceModel> getElectronicDeviceDetails(
      int electronicDeviceId) async {
    ElectronicDeviceResponse response =
        await _manager.getElectronicDeviceDetails(electronicDeviceId);
    if (response == null) return null;

    var df = new DateFormat('yyyy');
    return new ElectronicDeviceModel(
        id: electronicDeviceId,
        type: response.data.type,
        //TODO : change this after been added to the response
        location: response.data.city,
        description: response.data.description,
        price: response.data.price.toString(),
        brand: response.data.brand,
        city: response.data.city,
        country: response.data.country,
        editable: response.data.editable ?? false,
        //TODO : change this after been added to the response
        graphics: '',
        //TODO : change this after been added to the response
        storage: '',
        image: response.data.image,
        userName: response.data.username ?? '',
        userImage: response.data.userImage,
        isLoved: response.data.reaction.isLoved,
        images: _getImages(response),
        comments: response.data.comments);
  }

  Future<bool> updateElectronicDevice(
      ElectronicDeviceRequest request, otherImages) async {
    String uploadedImageUrl = request.image;
    if (!uploadedImageUrl.contains('http')) {
      uploadedImageUrl = (request.image.isNotEmpty)
          ? await _imageUploadService.uploadImage(request.image)
          : '';
    } else {
      List image = request.image.split('/${Urls.UPLOAD}/');
      uploadedImageUrl = image[1];
    }

    var electronicRequest = ElectronicDeviceRequest(
      id: request.id,
      image: uploadedImageUrl ?? '',
      state: request.state,
      country: request.country,
      description: request.description,
      price: request.price,
      status: request.status,
      city: request.city,
      type: request.type,
      brand: request.brand,
    );
    int result = await _manager.updateElectronicDevice(electronicRequest);

    if (result != null) await _uploadOtherImages(otherImages, result);
    return result != null;
  }

  List<String> _getImages(ElectronicDeviceResponse response) {
    List<String> result = [];

    response.data.images.forEach((element) {
      result.add(element.image);
    });

    return result;
  }

  Future<void> placeComment(CommentRequest request) async {
    var response = await _manager.placeComment(request);
  }
}
