import 'app.component.dart' as _i1;
import '../../module_localization/service/localization.service.dart' as _i2;
import '../../utils/logger/logger.dart' as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;
import '../../module_theme/service/theme.service.dart' as _i6;
import '../../module_theme/persistance/theme_preferences_helper.dart' as _i7;
import '../../module_localization/persistance/localization_prefrences_helper.dart'
    as _i8;
import '../../module_auth/auth_module.dart' as _i9;
import '../../module_auth/ui/screen/login/login_screen.dart' as _i10;
import '../../module_auth/state_manager/login/login.state_manager.dart' as _i11;
import '../../module_auth/service/auth/auth.service.dart' as _i12;
import '../../module_auth/persistance/auth_prefs_helper.dart' as _i13;
import '../../module_auth/manager/auth/auth.manager.dart' as _i14;
import '../../module_auth/repository/auth/auth.repository.dart' as _i15;
import '../../module_network/http_client/http_client.dart' as _i16;
import '../../module_auth/ui/screen/register/register_screen.dart' as _i17;
import '../../module_auth/state_manager/register/register.state_manager.dart'
    as _i18;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.LocalizationService _singletonLocalizationService;

  _i3.Logger _singletonLogger;

  static _i4.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp(_createAppThemeDataService(),
      _createLocalizationService(), _createAuthorizationModule());
  _i6.AppThemeDataService _createAppThemeDataService() =>
      _i6.AppThemeDataService(_createThemePreferencesHelper());
  _i7.ThemePreferencesHelper _createThemePreferencesHelper() =>
      _i7.ThemePreferencesHelper();
  _i2.LocalizationService _createLocalizationService() =>
      _singletonLocalizationService ??=
          _i2.LocalizationService(_createLocalizationPreferencesHelper());
  _i8.LocalizationPreferencesHelper _createLocalizationPreferencesHelper() =>
      _i8.LocalizationPreferencesHelper();
  _i9.AuthorizationModule _createAuthorizationModule() =>
      _i9.AuthorizationModule(_createLoginScreen(), _createRegisterScreen());
  _i10.LoginScreen _createLoginScreen() =>
      _i10.LoginScreen(_createLoginStateManager());
  _i11.LoginStateManager _createLoginStateManager() =>
      _i11.LoginStateManager(_createAuthService());
  _i12.AuthService _createAuthService() =>
      _i12.AuthService(_createAuthPrefsHelper(), _createAuthManager());
  _i13.AuthPrefsHelper _createAuthPrefsHelper() => _i13.AuthPrefsHelper();
  _i14.AuthManager _createAuthManager() =>
      _i14.AuthManager(_createAuthRepository());
  _i15.AuthRepository _createAuthRepository() =>
      _i15.AuthRepository(_createApiClient());
  _i16.ApiClient _createApiClient() => _i16.ApiClient(_createLogger());
  _i3.Logger _createLogger() => _singletonLogger ??= _i3.Logger();
  _i17.RegisterScreen _createRegisterScreen() =>
      _i17.RegisterScreen(_createRegisterStateManager());
  _i18.RegisterStateManager _createRegisterStateManager() =>
      _i18.RegisterStateManager(_createAuthService());
  @override
  _i5.MyApp get app => _createMyApp();
}
