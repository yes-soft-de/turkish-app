

import 'package:hersay/module_search/response/search/search_response.dart';
import 'package:hersay/utils/enums/products/products.dart';

class SearchModel{
  int id;
  String brand;
  String type;
  PRODUCT_TYPE  productType;

  SearchModel({
    this.type,
    this.brand,
    this.id,
    this.productType,
});

  static getSearchModelResult(SearchResponse response){
    List<SearchModel> result = [];

    response.data.forEach((element) {
      switch(element.entity){
        case 'car' : result.add(
                    SearchModel(
                      type: '',
                      brand: element.brand,
                      id: element.id,
                      productType: PRODUCT_TYPE.CAR,
                 )
        );
        break;
        case 'device' : result.add(
            SearchModel(
              type: '',
              brand: element.brand,
              id: element.id,
              productType: PRODUCT_TYPE.ELECTRONIC_DEVICE,
            )
        );
        break;
        case 'realEstate' : result.add(
            SearchModel(
              type: element.realEstateType,
              brand: '',
              id: element.id,
              productType: PRODUCT_TYPE.REAL_ESTATE,
            )
        );
        break;
      }
    });

    return result;
  }
}