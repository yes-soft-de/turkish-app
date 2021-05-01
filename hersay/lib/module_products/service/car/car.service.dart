import 'package:hersay/consts/urls.dart';
import 'package:hersay/module_products/manager/car/car.manager.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/request/comment/comment_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';
import 'package:intl/intl.dart';

@provide
class CarService {
  final CarManager _manager;
  final ImageUploadService _imageUploadService;
  CarService(
    this._manager,
    this._imageUploadService,
  );

  Future<bool> addNewCar(
    int price,
    String description,
    String distance,
    String carType,
    String gearType,
    String location,
    String yearOfRelease,
    String mainImagePath,
    String country,
    String city,
    String status,
    List<String> otherImages,
  ) async {
    String uploadedImageUrl = (mainImagePath != null)
        ? await _imageUploadService.uploadImage(mainImagePath)
        : '';

    var carRequest = CarRequest(
      yearOfRelease: yearOfRelease,
      image: uploadedImageUrl,
      city: city,
      status: status,
      price: price,
      description: description,
      country: country,
      carType: carType,
      distance: distance,
      gearType: gearType,
      location: location,
    );
    int result = await _manager.addNewCar(carRequest);

    if (result != null) await _uploadOtherImages(otherImages, result);

    return result != null;
  }

  Future<void> _uploadOtherImages(List<String> filePaths, int itemId) async {
    List<String> imagesUrl =
        await _imageUploadService.uploadMultipleImages(filePaths);
    await _imageUploadService.setImagesToProduct(imagesUrl, 'car', itemId);
  }

  Future<CarModel> getCarDetails(int carId) async {
    CarResponse response = await _manager.getCarDetails(carId);
    if (response == null) return null;
    var format = DateFormat('yyyy');
    var date = format.format(DateTime.fromMillisecondsSinceEpoch(
        response.data.yearOfRelease.timestamp * 1000));
    return new CarModel(
        id: carId,
        type: response.data.carType,
        distance: response.data.distance,
        //TODO : change this after been added to the response
        location: response.data.country,
        gearType: response.data.gearType,
        price: response.data.price.toString(),
        //TODO : change this after been added to the response
        useDuration: '',
        city: response.data.city,
        country: response.data.country,
        image: response.data.image,
        userName: response.data.username,
        userImage: response.data.userImage,
        isLoved: response.data.reaction.isLoved,
        images: _getImages(response),
        yearOfProdaction: date.toString(),
        discription: response.data.description,
        editable: response.data.editable ?? false,
        comments: response.data.comments);
  }

  Future<bool> updateCar(CarRequest request, List<String> otherImages) async {
    String uploadedImageUrl = request.image;
    if (!uploadedImageUrl.contains('http')) {
      uploadedImageUrl = (request.image.isNotEmpty)
          ? await _imageUploadService.uploadImage(request.image)
          : '';
    } else {
      List image = request.image.split('/${Urls.UPLOAD}/');
      uploadedImageUrl = image[1];
    }

    var carRequest = CarRequest(
      id: request.id,
      image: uploadedImageUrl ?? '',
      description: request.description,
      yearOfRelease: request.yearOfRelease,
      city: request.city,
      status: request.status,
      price: request.price,
      country: request.country,
      carType: request.carType,
      distance: request.distance,
      gearType: request.gearType,
      location: request.location,
    );
    int result = await _manager.updateCar(carRequest);

    if (result != null && otherImages != null)
      await _uploadOtherImages(otherImages, result);

    return result != null;
  }

  List<String> _getImages(CarResponse response) {
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
