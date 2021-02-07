
import 'package:hersay/module_products/manager/car/car.manager.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:inject/inject.dart';

@provide
class CarService{
  final CarManager _manager;
  final ImageUploadService _imageUploadService;

  CarService(
      this._manager,
      this._imageUploadService,
      );



  Future<bool> addNewCar(
  String brand,
  String company,
  String engine,
  int price,
  String description,
  String distance,
  String carType,
  String gearType,
  String cc,
  String fuel,
  String location,
  String yearOfRelease,
  String mainImagePath,
  String country,
  String city,
  String state,
  String status,
  List<String> otherImages,
      ) async {

    String uploadedImageUrl = (mainImagePath != null)
        ? await _imageUploadService.uploadImage(mainImagePath)
        :'';

    var carRequest = CarRequest(
      yearOfRelease: yearOfRelease,
      brand: brand,
      image: uploadedImageUrl,
      city: city,
      status: status,
      price: price,
      description: description,
      country: country,
      state: state,
      carType: carType,
      cc: cc,
      company: company,
      distance: distance,
      engine: engine,
      fuel: fuel,
      gearType: gearType,
      location: location,
    );
    int result = await _manager.addNewCar(carRequest);


    if (result != null )  await _uploadOtherImages(otherImages,result);

    return result !=  null;
  }

  Future<void> _uploadOtherImages(List<String> filePaths,int itemId) async{
     List<String> imagesUrl = await _imageUploadService.uploadMultipleImages(filePaths);
     await _imageUploadService.setImagesToProduct(imagesUrl, 'car', itemId);

  }

  Future<CarModel> getCarDetails(int carId)async{
   CarResponse response = await _manager.getCarDetails(carId);
   if(response == null) return null;
   
   return new CarModel(
       type:response.data.carType,
       brand:response.data.brand,
       distance:response.data.distance,
       //TODO : change this after been added to the response
       location:'',
       fuel:response.data.fuel,
       gearType:response.data.gearType,
       price:response.data.price.toString(),
       cc:response.data.cc,
     //TODO : change this after been added to the response
       useDuration:'',
       cylinder: response.data.engine,
       image: response.data.image,
       userName: response.data.username,
       userImage: response.data.userImage,
       isLoved: response.data.reaction.isLoved,
       images: _getImages(response),
   );

  }

  List<String> _getImages(CarResponse response){
    List<String> result = [];

    response.data.images.forEach((element) {
      result.add(element.image);
    });

    return result;
  }

}