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
    String cpu,
    String ram,
    String battery,
    int price,
    String yearOfRelease,
    String description,
    String gauge,
    String city,
    String durationOfUse,
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
      battery: battery,
      brand: brand,
      cpu: cpu,
      durationOfUse: durationOfUse,
      gauge: gauge,
      ram: ram,
      yearOfRelease: yearOfRelease,
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
    var date;
    if (response.data.yearOfRelease != null) {
      date = new DateTime.fromMillisecondsSinceEpoch(
          response.data.yearOfRelease.timestamp * 1000);
    } else {
      date = DateTime.now();
    }

    return new ElectronicDeviceModel(
      id: electronicDeviceId,
        type: response.data.type,
        //TODO : change this after been added to the response
        location: '',
        description: response.data.description,
        price: response.data.price.toString(),
        brand: response.data.brand,
        //TODO : change this after been added to the response
        graphics: '',
        processor: response.data.cpu,
        releaseYear: df.format(date).toString(),
        //TODO : change this after been added to the response
        storage: '',
        useDuration: response.data.durationOfUse,
        image: response.data.image,
        userName: response.data.username,
        userImage: response.data.userImage,
        isLoved: response.data.reaction.isLoved,
        images: _getImages(response),
        comments: response.data.comments);
  }

  List<String> _getImages(ElectronicDeviceResponse response) {
    List<String> result = [];

    response.data.images.forEach((element) {
      result.add(element.image);
    });

    return result;
  }

   Future<void> placeComment(CommentRequest request) async {
    var response =
        await _manager.placeComment(request);
  }
}
