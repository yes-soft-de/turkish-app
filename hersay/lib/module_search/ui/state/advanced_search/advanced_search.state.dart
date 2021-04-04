import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_products/products_routes.dart';
import 'package:hersay/module_search/model/search/search_model.dart';
import 'package:hersay/module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart';
import 'package:hersay/utils/enums/products/products.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/product_card/product_card.dart';

abstract class AdvancedSearchState {
  final AdvancedSearchScreenState screenState;

  AdvancedSearchState(this.screenState);

  Widget getUI(BuildContext context);
}

class AdvancedSearchStateInit extends AdvancedSearchState {
  AdvancedSearchStateInit(AdvancedSearchScreenState screenState)
      : super(screenState);
  String _selectedEntityType;
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _lowestPriceController = TextEditingController();
  final TextEditingController _highestPriceController = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    List<String> _entityTypes = ['car', 'realEstate', 'device'];

    final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();

    bool _autoValidate = false;

    return Form(
      key: _searchFormKey,
      autovalidateMode: _autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              // entity
              Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 340,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint:
                              /* _selectedEntityType == null
                              ?*/
                              Text(
                            S.of(context).chooseEntity,
                            style: TextStyle(color: Colors.grey),
                          ),
                          /*: Text(
                            '$_selectedEntityType',
                            style: TextStyle(color: Colors.grey),
                          )*/
                          value: _selectedEntityType ?? null,
                          items: _entityTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedEntityType = value;
                            screenState.refresh();
                          }),
                    ),
                  )),
              // price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _lowestPriceController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: S.of(context).lowestPrice,
                        ),
                        textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return S.of(context).thisFieldCannotBeEmpty;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _highestPriceController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: S.of(context).highestPrice,
                        ),
                        textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return S.of(context).thisFieldCannotBeEmpty;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // city
              Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: S.of(context).city,
                    ),
                    textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                    // Move focus to next
                    validator: (result) {
                      if (result.isEmpty) {
                        return S.of(context).thisFieldCannotBeEmpty;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 55,
                  margin: EdgeInsets.only(top: 30),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
//                        if (_searchFormKey.currentState.validate()) {
                        if (_selectedEntityType != null &&
                            (_cityController.text.isNotEmpty ||
                                _lowestPriceController.text.isNotEmpty ||
                                _highestPriceController.text.isNotEmpty ||
                                _cityController.text.isNotEmpty)) {
                          screenState.advancedSearch(
                            _selectedEntityType,
                            _cityController.text.trim(),
                            _lowestPriceController.text.trim(),
                            _highestPriceController.text.trim(),
                          );
                        }

                        //  }
                      },
                      //TODO : change this using theme service
                      color: ProjectColors.SECONDARY_COLOR,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          Text(
                            S.of(context).search,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdvancedSearchStateDataLoaded extends AdvancedSearchState {
  final List<SearchModel> searchResults;

  List<String> _entityTypes = ['car', 'realEstate', 'device'];
  String _selectedEntityType;
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _lowestPriceController = TextEditingController();
  final TextEditingController _highestPriceController = TextEditingController();

  AdvancedSearchStateDataLoaded(
      this.searchResults, AdvancedSearchScreenState screenState)
      : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: _searchFormKey,
      autovalidate: _autoValidate,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // entity
              Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 340,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint:
                              /*_selectedEntityType == null
                              ?*/
                              Text(
                            S.of(context).chooseEntity,
                            style: TextStyle(color: Colors.grey),
                          )
                          /* : Text(
                            '$_selectedEntityType',
                            style: TextStyle(color: Colors.grey),
                          )*/
                          ,
                          value: _selectedEntityType,
                          items: _entityTypes.map((String place) {
                            return new DropdownMenuItem<String>(
                              value: place.toString(),
                              child: new Text(place),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedEntityType = value;
                            screenState.refresh();
                          }),
                    ),
                  )),
              // price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _lowestPriceController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: S.of(context).lowestPrice,
                        ),
                        textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return S.of(context).thisFieldCannotBeEmpty;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _highestPriceController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: S.of(context).highestPrice,
                        ),
                        textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return S.of(context).thisFieldCannotBeEmpty;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // city
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: S.of(context).city,
                      ),
                      textInputAction: TextInputAction.next,
//                  onEditingComplete: () => node.nextFocus(),
                      // Move focus to next
                      validator: (result) {
                        if (result.isEmpty) {
                          return S.of(context).thisFieldCannotBeEmpty;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 55,
                  margin: EdgeInsets.only(top: 30),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
//                        if (_searchFormKey.currentState.validate()) {
                        if (_selectedEntityType != null &&
                            (_cityController.text.isNotEmpty ||
                                _lowestPriceController.text.isNotEmpty ||
                                _highestPriceController.text.isNotEmpty ||
                                _cityController.text.isNotEmpty)) {
                          screenState.advancedSearch(
                            _selectedEntityType,
                            _cityController.text.trim(),
                            _lowestPriceController.text.trim(),
                            _highestPriceController.text.trim(),
                          );
                        }
//                        }
                      },
                      //TODO : change this using theme service
                      color: ProjectColors.SECONDARY_COLOR,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          Text(
                            S.of(context).search,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ),

              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          switch (searchResults[index].productType) {
                            case PRODUCT_TYPE.CAR:
                              Navigator.pushNamed(
                                  context, ProductsRoutes.CAR_DETAILS_SCREEN,
                                  arguments: searchResults[index].id);
                              break;
                            case PRODUCT_TYPE.ELECTRONIC_DEVICE:
                              Navigator.pushNamed(
                                  context,
                                  ProductsRoutes
                                      .ELECTRONIC_DEVICE_DETAILS_SCREEN,
                                  arguments: searchResults[index].id);
                              break;
                            case PRODUCT_TYPE.REAL_ESTATE:
                              Navigator.pushNamed(context,
                                  ProductsRoutes.REAL_ESTATE_DETAILS_SCREEN,
                                  arguments: searchResults[index].id);
                              break;
                              case PRODUCT_TYPE.ADVERTISMENT:
                              Navigator.pushNamed(context,
                                  ProductsRoutes.SERVICE_DETAILS_SCREEN,
                                  arguments: searchResults[index].id);
                              break;
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          child: ProductCard(
                            image: searchResults[index].image,
                            category: searchResults[index].category,
                            likes: searchResults[index].likes,
                            comments: searchResults[index].commentsNumber,
                            owner: searchResults[index].userName,
                            ownerImage: searchResults[index].userImage,
                            product: (searchResults[index].type != '')
                                ? searchResults[index].type
                                : searchResults[index].brand,
                            specification: searchResults[index].specification,
                            type: searchResults[index].productType,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AdvancedSearchStateLoading extends AdvancedSearchState {
  AdvancedSearchStateLoading(AdvancedSearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AdvancedSearchStateUnauthorized extends AdvancedSearchState {
  AdvancedSearchStateUnauthorized(AdvancedSearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AdvancedSearchStateError extends AdvancedSearchState {
  final String errorMsg;

  AdvancedSearchStateError(this.errorMsg, AdvancedSearchScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}
