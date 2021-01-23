import 'app.component.dart' as _i1;
import '../../module_localization/service/localization.service.dart' as _i2;
import '../../utils/logger/logger.dart' as _i3;
import '../../module_products/products_module.dart' as _i4;
import 'dart:async' as _i5;
import '../../main.dart' as _i6;
import '../../module_theme/service/theme.service.dart' as _i7;
import '../../module_theme/persistance/theme_preferences_helper.dart' as _i8;
import '../../module_localization/persistance/localization_prefrences_helper.dart'
    as _i9;
import '../../module_auth/auth_module.dart' as _i10;
import '../../module_auth/ui/screen/login/login_screen.dart' as _i11;
import '../../module_auth/state_manager/login/login.state_manager.dart' as _i12;
import '../../module_auth/service/auth/auth.service.dart' as _i13;
import '../../module_auth/persistance/auth_prefs_helper.dart' as _i14;
import '../../module_auth/manager/auth/auth.manager.dart' as _i15;
import '../../module_auth/repository/auth/auth.repository.dart' as _i16;
import '../../module_network/http_client/http_client.dart' as _i17;
import '../../module_auth/ui/screen/register/register_screen.dart' as _i18;
import '../../module_auth/state_manager/register/register.state_manager.dart'
    as _i19;
import '../../module_products/ui/screen/add_real_estate/add_real_estate_screen.dart'
    as _i20;
import '../../module_products/state_manager/real_estate/add_real_estate.manager.dart'
    as _i21;
import '../../module_products/service/real_estate/real_estate.service.dart'
    as _i22;
import '../../module_products/manager/real_estate/real_estate.manager.dart'
    as _i23;
import '../../module_products/repository/real_estate/real_estate.repository.dart'
    as _i24;
import '../../module_products/ui/screen/add_car/add_car_sceen.dart' as _i25;
import '../../module_products/state_manager/car/add_car.state_manager.dart'
    as _i26;
import '../../module_products/service/car/car.service.dart' as _i27;
import '../../module_products/manager/car/car.manager.dart' as _i28;
import '../../module_products/repository/car/car.repository.dart' as _i29;
import '../../module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart'
    as _i30;
import '../../module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart'
    as _i31;
import '../../module_products/service/electronic_device/electronic_device.service.dart'
    as _i32;
import '../../module_products/manager/electronic_device/electronic_device.manager.dart'
    as _i33;
import '../../module_products/repository/electonic_device/electronic_device.repository.dart'
    as _i34;
import '../../module_splash/splash_module.dart' as _i35;
import '../../module_splash/ui/screen/splash_screen/splash_screen.dart' as _i36;
import '../../main_screen/main_module.dart' as _i37;
import '../../main_screen/ui/main_screen.dart' as _i38;
import '../../module_home/ui/sceen/home/home_screen.dart' as _i39;
import '../../module_home/state_manager/home/home.state_manager.dart' as _i40;
import '../../module_home/service/home/home.service.dart' as _i41;
import '../../module_home/manager/home/home.manager.dart' as _i42;
import '../../module_home/repository/home/home.repository.dart' as _i43;
import '../../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i44;
import '../../module_history/ui/screen/history/history_screen.dart' as _i45;
import '../../module_profile/ui/screen/profile/profile_screen.dart' as _i46;
import '../../module_settings/ui/screen/settings/settings_screen.dart' as _i47;
import '../../module_home/home_module.dart' as _i48;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.LocalizationService _singletonLocalizationService;

  _i3.Logger _singletonLogger;

  _i4.ProductsModule _singletonProductsModule;

  static _i5.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i6.MyApp _createMyApp() => _i6.MyApp(
      _createAppThemeDataService(),
      _createLocalizationService(),
      _createAuthorizationModule(),
      _createProductsModule(),
      _createSplashModule(),
      _createMainModule(),
      _createHomeModule());
  _i7.AppThemeDataService _createAppThemeDataService() =>
      _i7.AppThemeDataService(_createThemePreferencesHelper());
  _i8.ThemePreferencesHelper _createThemePreferencesHelper() =>
      _i8.ThemePreferencesHelper();
  _i2.LocalizationService _createLocalizationService() =>
      _singletonLocalizationService ??=
          _i2.LocalizationService(_createLocalizationPreferencesHelper());
  _i9.LocalizationPreferencesHelper _createLocalizationPreferencesHelper() =>
      _i9.LocalizationPreferencesHelper();
  _i10.AuthorizationModule _createAuthorizationModule() =>
      _i10.AuthorizationModule(_createLoginScreen(), _createRegisterScreen());
  _i11.LoginScreen _createLoginScreen() =>
      _i11.LoginScreen(_createLoginStateManager());
  _i12.LoginStateManager _createLoginStateManager() =>
      _i12.LoginStateManager(_createAuthService());
  _i13.AuthService _createAuthService() =>
      _i13.AuthService(_createAuthPrefsHelper(), _createAuthManager());
  _i14.AuthPrefsHelper _createAuthPrefsHelper() => _i14.AuthPrefsHelper();
  _i15.AuthManager _createAuthManager() =>
      _i15.AuthManager(_createAuthRepository());
  _i16.AuthRepository _createAuthRepository() =>
      _i16.AuthRepository(_createApiClient());
  _i17.ApiClient _createApiClient() => _i17.ApiClient(_createLogger());
  _i3.Logger _createLogger() => _singletonLogger ??= _i3.Logger();
  _i18.RegisterScreen _createRegisterScreen() =>
      _i18.RegisterScreen(_createRegisterStateManager());
  _i19.RegisterStateManager _createRegisterStateManager() =>
      _i19.RegisterStateManager(_createAuthService());
  _i4.ProductsModule _createProductsModule() =>
      _singletonProductsModule ??= _i4.ProductsModule(
          _createAddRealEstateScreen(),
          _createAddCarScreen(),
          _createAddElectronicDeviceScreen());
  _i20.AddRealEstateScreen _createAddRealEstateScreen() =>
      _i20.AddRealEstateScreen(_createAddRealEstateStateManager());
  _i21.AddRealEstateStateManager _createAddRealEstateStateManager() =>
      _i21.AddRealEstateStateManager(_createRealEstateService());
  _i22.RealEstateService _createRealEstateService() =>
      _i22.RealEstateService(_createRealEstateManager());
  _i23.RealEstateManager _createRealEstateManager() =>
      _i23.RealEstateManager(_createRealEstateRepository());
  _i24.RealEstateRepository _createRealEstateRepository() =>
      _i24.RealEstateRepository(_createApiClient(), _createAuthService());
  _i25.AddCarScreen _createAddCarScreen() =>
      _i25.AddCarScreen(_createAddCarStateManager());
  _i26.AddCarStateManager _createAddCarStateManager() =>
      _i26.AddCarStateManager(_createCarService());
  _i27.CarService _createCarService() => _i27.CarService(_createCarManager());
  _i28.CarManager _createCarManager() =>
      _i28.CarManager(_createCarRepository());
  _i29.CarRepository _createCarRepository() =>
      _i29.CarRepository(_createApiClient(), _createAuthService());
  _i30.AddElectronicDeviceScreen _createAddElectronicDeviceScreen() =>
      _i30.AddElectronicDeviceScreen(_createAddElectronicDeviceStateManager());
  _i31.AddElectronicDeviceStateManager
      _createAddElectronicDeviceStateManager() =>
          _i31.AddElectronicDeviceStateManager(
              _createElectronicDeviceService());
  _i32.ElectronicDeviceService _createElectronicDeviceService() =>
      _i32.ElectronicDeviceService(_createElectronicDeviceManager());
  _i33.ElectronicDeviceManager _createElectronicDeviceManager() =>
      _i33.ElectronicDeviceManager(_createElectronicDeviceRepository());
  _i34.ElectronicDeviceRepository _createElectronicDeviceRepository() =>
      _i34.ElectronicDeviceRepository(_createApiClient(), _createAuthService());
  _i35.SplashModule _createSplashModule() =>
      _i35.SplashModule(_createSplashScreen());
  _i36.SplashScreen _createSplashScreen() =>
      _i36.SplashScreen(_createAuthService());
  _i37.MainModule _createMainModule() => _i37.MainModule(_createMainScreen());
  _i38.MainScreen _createMainScreen() => _i38.MainScreen(
      _createHomeScreen(),
      _createChatsListScreen(),
      _createHistoryScreen(),
      _createProfileScreen(),
      _createSettingsScreen());
  _i39.HomeScreen _createHomeScreen() =>
      _i39.HomeScreen(_createHomeStateManager());
  _i40.HomeStateManager _createHomeStateManager() =>
      _i40.HomeStateManager(_createHomeService(), _createAuthService());
  _i41.HomeService _createHomeService() =>
      _i41.HomeService(_createHomeManager());
  _i42.HomeManager _createHomeManager() =>
      _i42.HomeManager(_createHomeRepository());
  _i43.HomeRepository _createHomeRepository() =>
      _i43.HomeRepository(_createApiClient(), _createAuthService());
  _i44.ChatsListScreen _createChatsListScreen() => _i44.ChatsListScreen();
  _i45.HistoryScreen _createHistoryScreen() => _i45.HistoryScreen();
  _i46.ProfileScreen _createProfileScreen() => _i46.ProfileScreen();
  _i47.SettingsScreen _createSettingsScreen() => _i47.SettingsScreen();
  _i48.HomeModule _createHomeModule() => _i48.HomeModule(_createHomeScreen());
  @override
  _i6.MyApp get app => _createMyApp();
}
