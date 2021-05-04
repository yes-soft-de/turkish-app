import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:hersay/utils/enums/products/products.dart';

class HomeModel {
  List<HomeElement> realEstates;
  List<HomeElement> cars;
  List<HomeElement> electronicDevices;
  List<HomeElement> advertisement;
  List<Categories> categories;
  HomeModel(
      {this.realEstates,
      this.cars,
      this.electronicDevices,
      this.advertisement,
      this.categories});

  static List<HomeElement> toRealEstatesList(HomeResponse homeData) {
    List<HomeElement> result = [];
    homeData.realEstates.data.forEach((element) {
      result.add(new HomeElement(
          id: element.id,
          product: element.title??'',
          image: element.image,
          ownerImage: element.imageUser ?? '',
          type: PRODUCT_TYPE.REAL_ESTATE,
          likes: (element.reaction != null)
              ? element.reaction[0].reactionCount
              : 0,
          category: element.realEstateType,
          owner: element.userName ?? '',
          specification: element.description,
          comments: element.commentsCount));
    });
    return result;
  }

  static List<HomeElement> toCarsList(HomeResponse homeData) {
    List<HomeElement> result = [];
    homeData.cars.data.forEach((element) {
      result.add(new HomeElement(
          id: element.id,
          product: element.title??'',
          image: element.image,
          type: PRODUCT_TYPE.CAR,
          likes: (element.reaction != null)
              ? element.reaction[0].reactionCount
              : 0,
          category: element.carType ?? '',
          owner: element.userName ?? '',
          ownerImage: element.imageUser ?? '',
          specification: element.description??'',
          comments: element.commentsCount));
    });
    return result;
  }

  static List<HomeElement> toElectronicDevicesList(HomeResponse homeData) {
    List<HomeElement> result = [];
    homeData.electronicDevices.data.forEach((element) {
      result.add(new HomeElement(
          id: element.id,
          product: element.title??'',
          image: element.image,
          type: PRODUCT_TYPE.ELECTRONIC_DEVICE,
          likes: (element.reaction != null)
              ? element.reaction[0].reactionCount
              : 0,
          category: element.brand??'',
          ownerImage: element.imageUser ?? '',
          owner: element.userName ?? '',
          specification: element.description,
          comments: element.commentsCount));
    });
    return result;
  }

  static List<Categories> toCategoryList(HomeResponse homeData) {
    List<Categories> result = [];
    homeData.categoryResponse.data.forEach((element) {
      result.add(Categories(
          categoryId: element.categoryId, categoryName: element.categoryName));
    });
    return result;
  }

  static List<HomeElement> toAdvertisementList(HomeResponse homeData) {
    List<HomeElement> result = [];
    homeData.allAdvertisement.data.forEach((element) {
      result.add(new HomeElement(
          id: element.id,
          categoryId: element.categoryId,
          product: element.title ?? '',
          categoryName: element.categoryName,
          image: element.image,
          type: PRODUCT_TYPE.ADVERTISMENT,
          likes: (element.reaction != null)
              ? element.reaction[0].reactionCount
              : 0,
          category: element.categoryName ?? '',
          ownerImage: element.imageUser ?? '',
          owner: element.userName ?? '',
          specification: element.description,
          comments: element.commentsCount
          
          ));
    });
    return result;
  }
}

class HomeElement {
  int id;
  int categoryId;
  String categoryName;
  String product;
  String category;
  String image;
  String owner;
  String ownerImage;
  PRODUCT_TYPE type;
  String specification;
  int likes;
  int comments;
  String title;
  HomeElement(
      {this.id,
      this.image,
      this.likes,
      this.category,
      this.owner,
      this.ownerImage,
      this.product,
      this.specification,
      this.type,
      this.comments,
      this.title,
      this.categoryId,
      this.categoryName
      });
}

class Categories {
  int categoryId;
  String categoryName;
  Categories({this.categoryId, this.categoryName});
}
