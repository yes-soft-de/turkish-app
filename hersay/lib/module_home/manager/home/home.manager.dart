
import 'package:hersay/module_home/repository/home/home.repository.dart';
import 'package:hersay/module_home/response/home/home_response.dart';
import 'package:inject/inject.dart';

@provide
class HomeManager{
  final HomeRepository _repository;

  HomeManager(
      this._repository,
      );

  Future<HomeResponse> getHomeScreenData() async => _repository.getHomeScreenData();
}