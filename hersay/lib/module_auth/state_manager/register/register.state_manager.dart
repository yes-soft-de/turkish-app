
import 'package:hersay/module_auth/enumes/auth_status.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_auth/ui/screen/register/register_screen.dart';
import 'package:hersay/module_auth/ui/states/register/register_state.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_code_sent.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_error.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_init.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_loading.dart';
import 'package:hersay/module_auth/ui/states/register/register_state_success.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class RegisterStateManager {
  final AuthService _authService;
  final PublishSubject<RegisterState> _registerStateSubject =
  PublishSubject<RegisterState>();

  RegisterStateManager(this._authService);

  Stream<RegisterState> get stateStream => _registerStateSubject.stream;

  void registerByPhoneNumber(
      String phoneNumber, RegisterScreenState _registerScreenState) {
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _registerStateSubject.add(RegisterStateSuccess(_registerScreenState));
          break;
        case AuthStatus.CODE_SENT:
          _registerStateSubject
              .add(RegisterStatePhoneCodeSent(_registerScreenState));
          break;
        case AuthStatus.CODE_TIMEOUT:
          _registerStateSubject
              .add(RegisterStateError(_registerScreenState, 'Code Timeout'));
          break;
        default:
          _registerStateSubject.add(RegisterStateInit(_registerScreenState));
          break;
      }
    }).onError((err) {
      _registerStateSubject
          .add(RegisterStateError(_registerScreenState, err.toString()));
    });

    _authService.verifyWithPhone(phoneNumber );
  }

  void registerByEmail(String email, String name, String password,
      RegisterScreenState _registerScreenState) {

    _registerStateSubject.add(RegisterStateLoading(_registerScreenState));
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _registerScreenState.moveToNext();
//          _registerStateSubject.add(RegisterStateSuccess(_registerScreenState));
          break;
        default:
          _registerStateSubject.add(RegisterStateInit(_registerScreenState));
          break;
      }
    }).onError((err) {
      _registerStateSubject
          .add(RegisterStateError(_registerScreenState, err.toString()));
    });

    _authService.registerWithEmailAndPassword(
        email, password, name );
  }

  void confirmCode(String smsCode) {
    _authService.confirmWithCode(smsCode );
  }
}