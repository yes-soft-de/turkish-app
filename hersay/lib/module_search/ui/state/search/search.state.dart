
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_search/model/search/search_model.dart';
import 'package:hersay/module_search/ui/screen/search_screen/seach_screen.dart';
import 'package:hersay/module_search/ui/widget/search_card/search_card.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';



abstract class SearchState {
  final SearchScreenState screenState;

  SearchState(this.screenState);

  Widget getUI(BuildContext context);
}

class SearchStateInit extends SearchState {
  SearchStateInit(SearchScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {

    final TextEditingController _searchController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Center(
              child: TextFormField(
                controller: _searchController,
                onFieldSubmitted: (value) {
                  screenState.search(_searchController.text.trim());
                },
                decoration: InputDecoration(
                  hintText:
                  S.of(context).whatYouWantToSeachAbout  ,
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {

                      screenState.search(_searchController.text.trim());

                      }),
                ),
                validator: (result) {
                  if (result.isEmpty) {
                    return  S.of(context).whatYouWantToSeachAbout ;
                  }
                  return null;
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class SearchStateLoading extends SearchState {
  SearchStateLoading(SearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class SearchStateUnauthorized extends SearchState {
  SearchStateUnauthorized(SearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class SearchStateDataLoaded extends SearchState {
  final List<SearchModel> searchResults;
  final TextEditingController _searchController = TextEditingController();

  SearchStateDataLoaded(this.searchResults, SearchScreenState screenState ,String searchQuery)
      : super(screenState){
     _searchController.text = searchQuery;
  }
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Center(
              child: TextFormField(
                controller: _searchController,
                onFieldSubmitted: (value) {
                  screenState.search(_searchController.text.trim());
                },
                decoration: InputDecoration(
                  hintText:
                  S.of(context).whatYouWantToSeachAbout   ,
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        screenState.search(_searchController.text.trim());

                      }),
                ),
                validator: (result) {
                  if (result.isEmpty) {
                    return  S.of(context).whatYouWantToSeachAbout ;
                  }
                  return null;
                },
              ),
            ),

            if(searchResults.isNotEmpty)
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          switch (searchResults[index].productType) {
                            case PRODUCT_TYPE.CAR:
                              Navigator.pushNamed(
                                  context,
                                  ProductsRoutes.CAR_DETAILS_SCREEN,
                                  arguments: searchResults[index].id
                              );
                              break;
                            case PRODUCT_TYPE.ELECTRONIC_DEVICE:
                              Navigator.pushNamed(
                                  context,
                                  ProductsRoutes
                                      .ELECTRONIC_DEVICE_DETAILS_SCREEN,
                                  arguments: searchResults[index].id
                              );
                              break;
                            case PRODUCT_TYPE.REAL_ESTATE:
                              Navigator.pushNamed(
                                  context,
                                  ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
                                  arguments: searchResults[index].id
                              );
                              break;
                          }
                        },
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: ProductCard(
                        image: searchResults[index].image,
                        category: searchResults[index].category,
                        likes: 0,
                        owner: searchResults[index].userName,
                        product: (searchResults[index].type!='')?searchResults[index].type:searchResults[index].brand,
                        specification: searchResults[index].specification,
                        type: searchResults[index].productType,
                      ),
                    ),


                      ),
                    );
                  }
              ),
          ],
        ),
      ),
    );
  }


}

class SearchStateError extends SearchState {
  final String errorMsg;

  SearchStateError(this.errorMsg, SearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}