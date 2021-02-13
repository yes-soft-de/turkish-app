
import 'package:hersay/module_home/manager/home/home.manager.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:inject/inject.dart';

@provide
class HomeService{
  final HomeManager _manager;

  HomeService(
      this._manager,
      );

  Future<HomeModel> getHomeScreenData()async{
    HomeResponse response = await _manager.getHomeScreenData();
    if(response == null ) return null;

    HomeModel homeData = new HomeModel(
        realEstates: HomeModel.toRealEstatesList(response),
        cars : HomeModel.toCarsList(response),
        electronicDevices:HomeModel.toElectronicDevicesList(response)
    );

    return homeData;
  }
}