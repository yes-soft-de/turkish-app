
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/module_profile/ui/state/profile/profile.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class ProfileStateManager {
  final ProfileService _profileService;
  final AuthService _authService;
  final PublishSubject<ProfileState> _stateSubject = PublishSubject();

  Stream<ProfileState> get stateStream => _stateSubject.stream;

  ProfileStateManager(
      this._profileService,
      this._authService,
      );


  void getProfileScreenData(ProfileScreenState screenState) {
    _authService.isLoggedIn.then((value) {
      if (value) {
        _stateSubject.add(ProfileStateLoading(screenState));
        _profileService.getProfileScreenData().then((value) {
          if (value == null) {
            _stateSubject
                .add(ProfileStateError('Error Finding Data', screenState));
          } else {
            _stateSubject.add(ProfileStateDataLoaded(value, screenState));
          }
        });
      } else {
        _stateSubject.add(ProfileStateUnauthorized(screenState));
      }
    });
  }
}