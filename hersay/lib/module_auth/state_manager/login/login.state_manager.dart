import 'package:hersay/module_auth/enumes/auth_status.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_auth/ui/screen/login/login_screen.dart';
import 'package:hersay/module_auth/ui/states/login/login_state.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_code_sent.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_error.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_init.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_loading.dart';
import 'package:hersay/module_auth/ui/states/login/login_state_success.dart';
import 'package:hersay/module_profile/service/profile/profile.service.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class LoginStateManager {
  final AuthService _authService;
  final ProfileService _profileService;
  final PublishSubject<LoginState> _loginStateSubject =
      PublishSubject<LoginState>();

  String _email;
  String _password;

  LoginStateManager(this._authService, this._profileService);

  Stream<LoginState> get stateStream => _loginStateSubject.stream;

  void loginCaptain(String phoneNumber, LoginScreenState _loginScreenState) {
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _loginStateSubject.add(LoginStateSuccess(_loginScreenState));
          break;
        case AuthStatus.CODE_SENT:
          _loginStateSubject.add(LoginStateCodeSent(_loginScreenState));
          break;
        case AuthStatus.CODE_TIMEOUT:
          _loginStateSubject.add(LoginStateError(
              _loginScreenState, 'Code Timeout', _email, _password));
          break;
        default:
          _loginStateSubject.add(LoginStateInit(_loginScreenState));
          break;
      }
    }).onError((err) {
      _loginStateSubject.add(LoginStateError(
          _loginScreenState, err.toString(), _email, _password));
    });

    _authService.verifyWithPhone(phoneNumber);
  }

  void login(
      String email, String password, LoginScreenState _loginScreenState) {
    _email = email;
    _password = password;
    _loginStateSubject.add(LoginStateLoading(_loginScreenState));
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _profileService.getProfileScreenData();
          _loginScreenState.moveToNext();
          break;
        default:
          _loginStateSubject.add(LoginStateInit(_loginScreenState));
          break;
      }
    }).onError((err) {
      _loginStateSubject.add(LoginStateError(
          _loginScreenState, err.toString(), _email, _password));
    });

    _authService.signInWithEmailAndPassword(email, password);
  }

  void confirmCaptainCode(String smsCode) {
    _authService.confirmWithCode(smsCode);
  }
}
