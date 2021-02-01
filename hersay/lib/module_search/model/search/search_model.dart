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

  SearchModel({
    this.type,
    this.brand,
    this.id,
    this.productType,
    this.userName,
    this.userImage,
    this.image,
    this.category,
    this.specification,
  });

  static getSearchModelResult(SearchResponse response,{String entity}) {
    List<SearchModel> result = [];
    if(entity!= null){
      response.data.forEach((element) {
        switch ( entity) {
          case 'car':
            result.add(SearchModel(
              type: '',
              brand: element.brand,
              id: element.id,
              productType: PRODUCT_TYPE.CAR,
              userName: element.userName,
              userImage: element.imageUser??'',
              image: element.image,
              category: element.company,
              specification: element.distance +' KM',
            ));
            break;
          case 'device':
            result.add(SearchModel(
              type: '',
              brand: element.brand,
              id: element.id,
              productType: PRODUCT_TYPE.ELECTRONIC_DEVICE,
              userName: element.userName,
              userImage: element.imageUser,
              image: element.image,
              category: element.type,
              specification: element.cpu,
            ));
            break;
          case 'realEstate':
            result.add(SearchModel(
              type: element.realEstateType,
              brand: '',
              id: element.id,
              productType: PRODUCT_TYPE.REAL_ESTATE,
              userName: element.userName,
              userImage: element.imageUser,
              image: element.image,
              category: element.numberOfFloors + ' floors',
              specification: element.space + ' SM',
            ));
            break;
        }
      });
    }

   else{
      response.data.forEach((element) {
        switch (element.entity) {
          case 'car':
            result.add(SearchModel(
              type: '',
              brand: element.brand,
              id: element.id,
              productType: PRODUCT_TYPE.CAR,
              userName: element.userName,
              userImage: element.imageUser,
              image: element.image,
              category: element.company,
              specification: element.distance +' KM',
            ));
            break;
          case 'device':
            result.add(SearchModel(
              type: '',
              brand: element.brand,
              id: element.id,
              productType: PRODUCT_TYPE.ELECTRONIC_DEVICE,
              userName: element.userName,
              userImage: element.imageUser,
              image: element.image,
              category: element.type,
              specification: element.cpu,
            ));
            break;
          case 'realEstate':
            result.add(SearchModel(
              type: element.realEstateType,
              brand: '',
              id: element.id,
              productType: PRODUCT_TYPE.REAL_ESTATE,
              userName: element.userName,
              userImage: element.imageUser,
              image: element.image,
              category: element.numberOfFloors + ' floors',
              specification: element.space + ' SM',
            ));
            break;
        }
      });
    }

    return result;
  }
}
