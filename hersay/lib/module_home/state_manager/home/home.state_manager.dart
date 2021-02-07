
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_home/service/home/home.service.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_home/ui/state/home/home.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class HomeStateManager {
  final HomeService _homeService;
  final AuthService _authService;
  final PublishSubject<HomeState> _stateSubject = PublishSubject();

  Stream<HomeState> get stateStream => _stateSubject.stream;

  HomeStateManager(
      this._homeService,
      this._authService,
      );

  void getHomeScreenData(HomeScreenState screenState) {

        _stateSubject.add(HomeStateLoading(screenState));
        _homeService.getHomeScreenData().then((value) {
          if (value == null) {
            _stateSubject
                .add(HomeStateError('Error Finding Data', screenState));
          } else {
            _stateSubject.add(HomeStateDataLoaded(value, screenState));
          }
        });

  }
}