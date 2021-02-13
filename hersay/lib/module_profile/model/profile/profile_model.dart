import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:hersay/module_profile/response/profile/profile_response.dart';
import 'package:hersay/utils/enums/products/products.dart';

class ProfileModel{
  String userName;
  String userImage;
  String country;
  String city;
  List<ProfileElement> realEstates;
  List<ProfileElement> cars;
  List<ProfileElement> electronicDevices;

  ProfileModel(
      {
        this.userName,
        this.userImage,
        this.realEstates,
        this.cars,
        this.electronicDevices,
        this.city,
        this.country,
      });

  static List<ProfileElement> toRealEstatesList(ProfileResponse homeData){
    List<ProfileElement> result = [];
    if(homeData.realEstates.data != null){
      homeData.realEstates.data.forEach((element) {
        result.add(
            new ProfileElement(
              id: element.id,
              product: element.realEstateType,
              image: element.image,
              type: PRODUCT_TYPE.REAL_ESTATE,
              likes: (element.reaction!= null)? element.reaction[0].reactionCount : 0,
              category: element.numberOfFloors + ' floors',
              owner: element.userName??'',
              specification: element.space + ' SM',
            )
        );
      });
    }

    return result;
  }

  static List<ProfileElement> toCarsList(ProfileResponse homeData){
    List<ProfileElement> result = [];

    if(homeData.cars.data != null){
      homeData.cars.data.forEach((element) {
        result.add(
            new ProfileElement(
              id: element.id,
              product: element.brand,
              image: element.image,
              type: PRODUCT_TYPE.CAR,
              likes:(element.reaction!= null)? element.reaction[0].reactionCount : 0,
              category: element.company  ,
              owner: element.userName??'',
              specification: element.distance +' KM',
            )
        );
      });
    }

    return result;
  }

  static List<ProfileElement> toElectronicDevicesList(ProfileResponse homeData){
    List<ProfileElement> result = [];

    if(homeData.electronicDevices.data != null){
      homeData.electronicDevices.data.forEach((element) {
        result.add(
            new ProfileElement(
              id: element.id,
              product: element.brand,
              image: element.image,
              type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
              likes: (element.reaction!= null)? element.reaction[0].reactionCount : 0,
              category: element.type  ,
              owner: element.userName??'',
              specification: element.cpu,
            )
        );
      });
    }

    return result;
  }


}


class ProfileElement {
  int id;
  String product;
  String category;
  String image;
  String owner;
  PRODUCT_TYPE type;
  String specification;
  int likes;

  ProfileElement(
      {
        this.id,
        this.image,
        this.likes,
        this.category,
        this.owner,
        this.product,
        this.specification,
        this.type});
}
