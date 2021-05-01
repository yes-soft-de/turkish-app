import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_home/service/home/home.service.dart';
import 'package:hersay/module_home/ui/sceen/home/home_screen.dart';
import 'package:hersay/module_home/ui/state/home/home.state.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class HomeStateManager {
  final HomeService _homeService;
  final AuthService _authService;
  final ProfileService _profileService;
  final PublishSubject<HomeState> _stateSubject = PublishSubject();
  final PublishSubject<dynamic> _profileData = PublishSubject();

  Stream<HomeState> get stateStream => _stateSubject.stream;
  Stream<dynamic> get profileStream => _profileData.stream;

  HomeStateManager(
    this._homeService,
    this._authService,
    this._profileService,
  );

  void getHomeScreenData(HomeScreenState screenState) {
    _stateSubject.add(HomeStateLoading(screenState));
    _homeService.getHomeScreenData().then((value) {
      if (value == null) {
        _stateSubject.add(HomeStateError('Error Finding Data', screenState));
      } else {
        _stateSubject.add(HomeStateDataLoaded(value, screenState));
      }
    });
  }

  void getProfile(HomeScreenState screenState) {
    _profileService.getProfileScreenData().then((value) {
      if (value == null) {
        _profileData.add(null);
      }
      _profileData.add(value);
    });
  }
}
