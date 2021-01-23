import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:hersay/utils/enums/products/products.dart';

class HomeModel{
  List<HomeElement> realEstates;
  List<HomeElement> cars;
  List<HomeElement> electronicDevices;

  HomeModel(
      {
        this.realEstates,
        this.cars,
        this.electronicDevices,
    });

  static List<HomeElement> toRealEstatesList(HomeResponse homeData){
    List<HomeElement> result = [];
    homeData.realEstates.data.forEach((element) {
      result.add(
          new HomeElement(
            product: element.realEstateType,
            image: element.image,
            type: PRODUCT_TYPE.REAL_ESTATE,
            //TODO : change likes number and owner name to real data when it fetched from the backend
            likes: 0,
            category: element.numberOfFloors + ' floors',
            owner: 'Steve Josh',
            specification: element.space + ' SM',
          )
      );
    });
    return result;
  }

  static List<HomeElement> toCarsList(HomeResponse homeData){
    List<HomeElement> result = [];
    homeData.cars.data.forEach((element) {
      result.add(
          new HomeElement(
            product: element.brand,
            image: element.image,
            type: PRODUCT_TYPE.REAL_ESTATE,
            //TODO : change likes number and owner name to real data when it fetched from the backend
            likes: 0,
            category: element.company  ,
            owner: 'Steve Josh',
            specification: element.distance +' KM',
          )
      );
    });
    return result;
  }

  static List<HomeElement> toElectronicDevicesList(HomeResponse homeData){
    List<HomeElement> result = [];
    homeData.electronicDevices.data.forEach((element) {
      result.add(
          new HomeElement(
            product: element.brand,
            image: element.image,
            type: PRODUCT_TYPE.REAL_ESTATE,
            //TODO : change likes number and owner name to real data when it fetched from the backend
            likes: 0,
            category: element.type  ,
            owner: 'Steve Josh',
            specification: element.cpu,
          )
      );
    });
    return result;
  }


}


class HomeElement {
  final String product;
  final String category;
  final String image;
  final String owner;
  final PRODUCT_TYPE type;
  final String specification;
  final int likes;

  HomeElement(
      {this.image,
      this.likes,
      this.category,
      this.owner,
      this.product,
      this.specification,
      this.type});
}
