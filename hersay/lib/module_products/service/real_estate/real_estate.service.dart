import 'package:hersay/module_products/manager/real_estate/real_estate.manager.dart';
import 'package:hersay/module_products/model/real_estate/real_estate_model.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/request/real_estate/real_estate_request.dart';
import 'package:hersay/module_products/response/real_estate/real_estate_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';

@provide
class RealEstateService {
  final RealEstateManager _manager;
  final ImageUploadService _imageUploadService;

  RealEstateService(
    this._manager,
    this._imageUploadService,
  );

  Future<bool> addNewRealEstate(
      String country,
      String city,
      String space,
      int price,
      String description,
      String numberOfFloors,
      String homeFurnishing,
      String realEstateType,
      String status,
      String mainImagePath,
      List<String> otherImages) async {
    String uploadedImageUrl = (mainImagePath != null)
        ? await _imageUploadService.uploadImage(mainImagePath)
        : '';

    var realEstateRequest = RealEstateRequest(
      image: uploadedImageUrl,
      city: city,
      status: status,
      price: price,
      description: description,
      country: country,
      homeFurnishing: homeFurnishing,
      numberOfFloors: numberOfFloors,
      realEstateType: realEstateType,
      space: space,
    );
    int result = await _manager.addNewRealEstate(realEstateRequest);

    if (result != null) await _uploadOtherImages(otherImages, result);

    return result != null;
  }

  Future<void> _uploadOtherImages(List<String> filePaths, int itemId) async {
    List<String> imagesUrl =
        await _imageUploadService.uploadMultipleImages(filePaths);
    await _imageUploadService.setImagesToProduct(
        imagesUrl, 'realEstate', itemId);
  }

  Future<RealEstateModel> getRealEstateDetails(int realEstateId) async {
    RealEstateResponse response =
        await _manager.getRealEstateDetails(realEstateId);
    if (response == null) return null;

    return new RealEstateModel(
      id: realEstateId,
      price: response.data.price.toString(),
      description: response.data.description,
      type: response.data.realEstateType,
      space: response.data.space,
      //TODO : change this after been added to the response
      address: '${response.data.country} , ${response.data.city}',
      floorsNumber: response.data.numberOfFloors,
      isFurnished: response.data.homeFurnishing,
      image: response.data.image,
      userName: response.data.username,
      userImage: response.data.userImage,
      isLoved: response.data.reaction.isLoved,
      images: _getImages(response),
      comments: response.data.comments,
    );
  }

  List<String> _getImages(RealEstateResponse response) {
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
