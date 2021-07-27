import 'package:hersay/consts/urls.dart';
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
      String title,
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
      title: title,
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
      title: response.data.title,
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
      editable: response.data.editable ?? false,
      country: response.data.country,
      city: response.data.city,
      comments: response.data.comments,
    );
  }

  Future<bool> updateRealEstate(
      RealEstateRequest request, var otherImages) async {
    String uploadedImageUrl = request.image;
    if (!uploadedImageUrl.contains('http')) {
      uploadedImageUrl = (request.image.isNotEmpty)
          ? await _imageUploadService.uploadImage(request.image)
          : '';
    } else {
      List image = request.image.split('/${Urls.UPLOAD}/');
      uploadedImageUrl = image[1];
    }

    var realEstateRequest = RealEstateRequest(
        id: request.id,
        image: uploadedImageUrl ?? '',
        price: request.price,
        description: request.description,
        country: request.country,
        city: request.city,
        status: request.status,
        realEstateType: request.realEstateType,
        homeFurnishing: request.homeFurnishing,
        numberOfFloors: request.numberOfFloors,
        space: request.space,
        title: request.title
        );
    int result = await _manager.updateRealEstate(realEstateRequest);

    if (result != null) await _uploadOtherImages(otherImages, result);
    return result != null;
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
