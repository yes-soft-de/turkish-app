import 'package:hersay/module_home/manager/home/home.manager.dart';
import 'package:hersay/module_home/model/home/home_model.dart';
import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:inject/inject.dart';

@provide
class HomeService {
  final HomeManager _manager;
  final ProfileService _profileService;
  HomeService(this._manager, this._profileService);

  Future<HomeModel> getHomeScreenData() async {
    HomeResponse response = await _manager.getHomeScreenData();
    if (response == null) return null;
    HomeModel homeData = new HomeModel(
        realEstates: HomeModel.toRealEstatesList(response),
        cars: HomeModel.toCarsList(response),
        electronicDevices: HomeModel.toElectronicDevicesList(response),
        advertisement: HomeModel.toAdvertisementList(response),
        categories: HomeModel.toCategoryList(response));
    homeData = await filterResponse(homeData);
    return homeData;
  }

  Future<HomeModel> filterResponse(HomeModel homeData) async {
    var blackList = await _profileService.getBlackList();
    if (blackList.isEmpty) {
      return homeData;
    }
    homeData.advertisement
        .removeWhere((element) => blackList.contains(element.owner));
    homeData.cars.removeWhere((element) => blackList.contains(element.owner));
    homeData.realEstates
        .removeWhere((element) => blackList.contains(element.owner));
    homeData.electronicDevices
        .removeWhere((element) => blackList.contains(element.owner));

    return homeData;
  }
}
