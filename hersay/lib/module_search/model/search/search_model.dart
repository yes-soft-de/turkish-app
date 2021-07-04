import 'package:hersay/module_products/response/electronic_device/electronic_device_response.dart';
import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:hersay/utils/enums/products/products.dart';

class SearchModel {
  int id;
  String brand;
  String type;
  PRODUCT_TYPE productType;
  String image;
  String userName;
  String userImage;
  String category;
  String specification;
  int likes;
  int commentsNumber;
  SearchModel(
      {this.type,
      this.brand,
      this.id,
      this.productType,
      this.userName,
      this.userImage,
      this.image,
      this.category,
      this.specification,
      this.commentsNumber,
      this.likes});

  static getSearchModelResult(SearchResponse response, {String entity}) {
    List<SearchModel> result = [];
    if (entity != null) {
      response.data.forEach((element) {
        switch (entity) {
          case 'car':
            result.add(SearchModel(
                type: '',
                brand: element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.CAR,
                userName: element.userName,
                userImage: element.imageUser ?? '',
                image: element.image,
                category: element.carType,
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
          case 'device':
            result.add(SearchModel(
                type: '',
                brand: element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.ELECTRONIC_DEVICE,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category: element.brand,
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
          case 'realEstate':
            result.add(SearchModel(
                type: element.title??'',
                brand: '',
                id: element.id,
                productType: PRODUCT_TYPE.REAL_ESTATE,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category: element.realEstateType,
                specification:element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
            default:
            result.add(SearchModel(
                type: element.title??'',
                brand:element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.ADVERTISMENT,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category:element.categoryName??element.type??'',
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber
                
                ));
            break;
        }
      });
    } else {
      response.data.forEach((element) {
        switch (element.entity) {
          case 'car':
            result.add(SearchModel(
                type: '',
                brand: element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.CAR,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category: element.carType,
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
          case 'device':
            result.add(SearchModel(
                type: '',
                brand:element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.ELECTRONIC_DEVICE,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category:  element.brand,
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
          case 'realEstate':
            result.add(SearchModel(
                type: element.title??'',
                brand: '',
                id: element.id,
                productType: PRODUCT_TYPE.REAL_ESTATE,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category: element.realEstateType,
                specification: element.description ,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber));
            break;
            default:
            result.add(SearchModel(
                type:element.title??'',
                brand:element.title??'',
                id: element.id,
                productType: PRODUCT_TYPE.ADVERTISMENT,
                userName: element.userName,
                userImage: element.imageUser,
                image: element.image,
                category: element.categoryName??element.type??'',
                specification: element.description,
                likes: element.reaction[0].reactionCount,
                commentsNumber: element.commentsNumber
                
                ));
            break;
        }
      });
    }

    return result;
  }
}
