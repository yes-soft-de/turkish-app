
import 'package:hersay/module_products/manager/car/car.manager.dart';
import 'package:hersay/module_products/model/car/car_model.dart';
import 'package:hersay/module_products/request/car/car_request.dart';
import 'package:hersay/module_products/response/car/car_response.dart';
import 'package:inject/inject.dart';

@provide
class CarService{
  final CarManager _manager;

  CarService(
      this._manager,
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
  String image,
  String country,
  String city,
  String state,
  String status,
      ) async {

    var carRequest = CarRequest(
      yearOfRelease: yearOfRelease,
      brand: brand,
      image: image,
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
    return _manager.addNewCar(carRequest);
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
   );

  }

}