
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:hersay/module_profile/ui/screen/edit_profile/edit_profile_screen.dart';
import 'package:hersay/module_profile/ui/screen/profile/profile_screen.dart';
import 'package:hersay/module_profile/ui/state/edit_profile/edit_profile.state.dart';
import 'package:hersay/module_profile/ui/state/profile/profile.state.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class EditProfileStateManager {
  final ProfileService _profileService;
  final AuthService _authService;
  final PublishSubject<EditProfileState> _stateSubject = PublishSubject();

  Stream<EditProfileState> get stateStream => _stateSubject.stream;

  EditProfileStateManager(
      this._profileService,
      this._authService,
      );


  void updateProfile(String userName,String imagePath, EditProfileScreenState screenState) {
    _authService.isLoggedIn.then((value) {
      if (value) {

        _stateSubject.add(EditProfileStateLoading(screenState));
        _profileService.updateMyProfile(userName, imagePath).then((value) {
          if (value == null) {
            _stateSubject
                .add(EditProfileStateError('Error Finding Data', screenState));
          } else {
            _stateSubject.add(EditProfileStateSuccess( screenState));
            screenState.goBackToProfile();
          }
        });
      } else {
        _stateSubject.add(EditProfileStateUnauthorized(screenState));
      }
    });
  }

  void imageSelected(String name, String image,EditProfileScreenState screenState){


    _stateSubject.add(EditProfileStateInit(screenState,name,image: image));
  }
}