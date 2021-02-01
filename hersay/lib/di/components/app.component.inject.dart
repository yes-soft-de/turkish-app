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
import '../../module_upload/service/image_upload/image_upload_service.dart'
    as _i25;
import '../../module_upload/manager/upload_manager/upload_manager.dart' as _i26;
import '../../module_upload/repository/upload_repository/upload_repository.dart'
    as _i27;
import '../../module_products/ui/screen/add_car/add_car_sceen.dart' as _i28;
import '../../module_products/state_manager/car/add_car.state_manager.dart'
    as _i29;
import '../../module_products/service/car/car.service.dart' as _i30;
import '../../module_products/manager/car/car.manager.dart' as _i31;
import '../../module_products/repository/car/car.repository.dart' as _i32;
import '../../module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart'
    as _i33;
import '../../module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart'
    as _i34;
import '../../module_products/service/electronic_device/electronic_device.service.dart'
    as _i35;
import '../../module_products/manager/electronic_device/electronic_device.manager.dart'
    as _i36;
import '../../module_products/repository/electonic_device/electronic_device.repository.dart'
    as _i37;
import '../../module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart'
    as _i38;
import '../../module_products/state_manager/electroinic_device/electronic_device_details.state_manager.dart'
    as _i39;
import '../../module_products/ui/screen/real_estate_details/real_estate_details_screen.dart'
    as _i40;
import '../../module_products/state_manager/real_estate/real_estate_details.state_manager.dart'
    as _i41;
import '../../module_products/ui/screen/car_details/car_details_screen.dart'
    as _i42;
import '../../module_products/state_manager/car/car_details.state_manager.dart'
    as _i43;
import '../../module_splash/splash_module.dart' as _i44;
import '../../module_splash/ui/screen/splash_screen/splash_screen.dart' as _i45;
import '../../main_screen/main_module.dart' as _i46;
import '../../main_screen/ui/main_screen.dart' as _i47;
import '../../module_home/ui/sceen/home/home_screen.dart' as _i48;
import '../../module_home/state_manager/home/home.state_manager.dart' as _i49;
import '../../module_home/service/home/home.service.dart' as _i50;
import '../../module_home/manager/home/home.manager.dart' as _i51;
import '../../module_home/repository/home/home.repository.dart' as _i52;
import '../../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i53;
import '../../module_history/ui/screen/history/history_screen.dart' as _i54;
import '../../module_history/state_manager/history/history.state_manger.dart'
    as _i55;
import '../../module_history/service/history/history.service.dart' as _i56;
import '../../module_history/manager/history/history.manager.dart' as _i57;
import '../../module_history/repository/history/history.reppsitory.dart'
    as _i58;
import '../../module_notification/ui/screen/notifications/notification_screen.dart'
    as _i59;
import '../../module_notification/state_manager/notification/notification.state_manger.dart'
    as _i60;
import '../../module_notification/service/notification/notification.service.dart'
    as _i61;
import '../../module_notification/manager/notification/notification.manager.dart'
    as _i62;
import '../../module_notification/repository/notification/notification.reppsitory.dart'
    as _i63;
import '../../module_home/home_module.dart' as _i64;
import '../../module_search/search_module.dart' as _i65;
import '../../module_search/ui/screen/search_screen/seach_screen.dart' as _i66;
import '../../module_search/state_manager/search/search.state_manager.dart'
    as _i67;
import '../../module_search/service/search/search.service.dart' as _i68;
import '../../module_search/manager/search/search.manager.dart' as _i69;
import '../../module_search/repository/search.repository.dart' as _i70;
import '../../module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart'
    as _i71;
import '../../module_search/state_manager/advanced_search/advanced_search.state_manager.dart'
    as _i72;
import '../../module_settings/settings_module.dart' as _i73;
import '../../module_settings/ui/screen/settings/settings_screen.dart' as _i74;
import '../../module_notification/notification_module.dart' as _i75;
import '../../module_profile/Profile_module.dart' as _i76;
import '../../module_profile/ui/screen/profile/profile_screen.dart' as _i77;
import '../../module_profile/state_manager/profile/profile.state_manager.dart'
    as _i78;
import '../../module_profile/service/profile/profile.service.dart' as _i79;
import '../../module_profile/manager/profile/profile.manager.dart' as _i80;
import '../../module_profile/repository/profile/profile.repository.dart'
    as _i81;
import '../../module_profile/ui/screen/edit_profile/edit_profile_screen.dart'
    as _i82;
import '../../module_profile/state_manager/edit_profile/edit_profile.state_manager.dart'
    as _i83;
import '../../module_history/history_module.dart' as _i84;

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
      _createHomeModule(),
      _createSearchModule(),
      _createSettingModule(),
      _createNotificationModule(),
      _createProfileModule(),
      _createHistoryModule());
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
          _createAddElectronicDeviceScreen(),
          _createElectronicDeviceDetailsScreen(),
          _createRealEstateDetailsScreen(),
          _createCarDetailsScreen());
  _i20.AddRealEstateScreen _createAddRealEstateScreen() =>
      _i20.AddRealEstateScreen(_createAddRealEstateStateManager());
  _i21.AddRealEstateStateManager _createAddRealEstateStateManager() =>
      _i21.AddRealEstateStateManager(_createRealEstateService());
  _i22.RealEstateService _createRealEstateService() => _i22.RealEstateService(
      _createRealEstateManager(), _createImageUploadService());
  _i23.RealEstateManager _createRealEstateManager() =>
      _i23.RealEstateManager(_createRealEstateRepository());
  _i24.RealEstateRepository _createRealEstateRepository() =>
      _i24.RealEstateRepository(_createApiClient(), _createAuthService());
  _i25.ImageUploadService _createImageUploadService() =>
      _i25.ImageUploadService(_createUploadManager());
  _i26.UploadManager _createUploadManager() =>
      _i26.UploadManager(_createUploadRepository());
  _i27.UploadRepository _createUploadRepository() => _i27.UploadRepository();
  _i28.AddCarScreen _createAddCarScreen() =>
      _i28.AddCarScreen(_createAddCarStateManager());
  _i29.AddCarStateManager _createAddCarStateManager() =>
      _i29.AddCarStateManager(_createCarService());
  _i30.CarService _createCarService() =>
      _i30.CarService(_createCarManager(), _createImageUploadService());
  _i31.CarManager _createCarManager() =>
      _i31.CarManager(_createCarRepository());
  _i32.CarRepository _createCarRepository() =>
      _i32.CarRepository(_createApiClient(), _createAuthService());
  _i33.AddElectronicDeviceScreen _createAddElectronicDeviceScreen() =>
      _i33.AddElectronicDeviceScreen(_createAddElectronicDeviceStateManager());
  _i34.AddElectronicDeviceStateManager
      _createAddElectronicDeviceStateManager() =>
          _i34.AddElectronicDeviceStateManager(
              _createElectronicDeviceService());
  _i35.ElectronicDeviceService _createElectronicDeviceService() =>
      _i35.ElectronicDeviceService(
          _createElectronicDeviceManager(), _createImageUploadService());
  _i36.ElectronicDeviceManager _createElectronicDeviceManager() =>
      _i36.ElectronicDeviceManager(_createElectronicDeviceRepository());
  _i37.ElectronicDeviceRepository _createElectronicDeviceRepository() =>
      _i37.ElectronicDeviceRepository(_createApiClient(), _createAuthService());
  _i38.ElectronicDeviceDetailsScreen _createElectronicDeviceDetailsScreen() =>
      _i38.ElectronicDeviceDetailsScreen(
          _createElectronicDeviceDetailsStateManager());
  _i39.ElectronicDeviceDetailsStateManager
      _createElectronicDeviceDetailsStateManager() =>
          _i39.ElectronicDeviceDetailsStateManager(
              _createElectronicDeviceService());
  _i40.RealEstateDetailsScreen _createRealEstateDetailsScreen() =>
      _i40.RealEstateDetailsScreen(_createRealEstateDetailsStateManager());
  _i41.RealEstateDetailsStateManager _createRealEstateDetailsStateManager() =>
      _i41.RealEstateDetailsStateManager(_createRealEstateService());
  _i42.CarDetailsScreen _createCarDetailsScreen() =>
      _i42.CarDetailsScreen(_createCarDetailsStateManager());
  _i43.CarDetailsStateManager _createCarDetailsStateManager() =>
      _i43.CarDetailsStateManager(_createCarService());
  _i44.SplashModule _createSplashModule() =>
      _i44.SplashModule(_createSplashScreen());
  _i45.SplashScreen _createSplashScreen() =>
      _i45.SplashScreen(_createAuthService());
  _i46.MainModule _createMainModule() => _i46.MainModule(_createMainScreen());
  _i47.MainScreen _createMainScreen() => _i47.MainScreen(
      _createHomeScreen(),
      _createChatsListScreen(),
      _createHistoryScreen(),
      _createNotificationScreen());
  _i48.HomeScreen _createHomeScreen() =>
      _i48.HomeScreen(_createHomeStateManager());
  _i49.HomeStateManager _createHomeStateManager() =>
      _i49.HomeStateManager(_createHomeService(), _createAuthService());
  _i50.HomeService _createHomeService() =>
      _i50.HomeService(_createHomeManager());
  _i51.HomeManager _createHomeManager() =>
      _i51.HomeManager(_createHomeRepository());
  _i52.HomeRepository _createHomeRepository() =>
      _i52.HomeRepository(_createApiClient(), _createAuthService());
  _i53.ChatsListScreen _createChatsListScreen() => _i53.ChatsListScreen();
  _i54.HistoryScreen _createHistoryScreen() =>
      _i54.HistoryScreen(_createHistoryStateManager());
  _i55.HistoryStateManager _createHistoryStateManager() =>
      _i55.HistoryStateManager(_createHistoryService());
  _i56.HistoryService _createHistoryService() =>
      _i56.HistoryService(_createHistoryManager());
  _i57.HistoryManager _createHistoryManager() =>
      _i57.HistoryManager(_createHistoryRepository());
  _i58.HistoryRepository _createHistoryRepository() =>
      _i58.HistoryRepository(_createAuthService(), _createApiClient());
  _i59.NotificationScreen _createNotificationScreen() =>
      _i59.NotificationScreen(_createNotificationStateManager());
  _i60.NotificationStateManager _createNotificationStateManager() =>
      _i60.NotificationStateManager(_createNotificationService());
  _i61.NotificationService _createNotificationService() =>
      _i61.NotificationService(_createNotificationManager());
  _i62.NotificationManager _createNotificationManager() =>
      _i62.NotificationManager(_createNotificationRepository());
  _i63.NotificationRepository _createNotificationRepository() =>
      _i63.NotificationRepository(_createAuthService(), _createApiClient());
  _i64.HomeModule _createHomeModule() => _i64.HomeModule(_createHomeScreen());
  _i65.SearchModule _createSearchModule() =>
      _i65.SearchModule(_createSearchScreen(), _createAdvancedSearchScreen());
  _i66.SearchScreen _createSearchScreen() =>
      _i66.SearchScreen(_createSearchStateManager());
  _i67.SearchStateManager _createSearchStateManager() =>
      _i67.SearchStateManager(_createSearchService());
  _i68.SearchService _createSearchService() =>
      _i68.SearchService(_createSearchManager());
  _i69.SearchManager _createSearchManager() =>
      _i69.SearchManager(_createSearchRepository());
  _i70.SearchRepository _createSearchRepository() =>
      _i70.SearchRepository(_createApiClient(), _createAuthService());
  _i71.AdvancedSearchScreen _createAdvancedSearchScreen() =>
      _i71.AdvancedSearchScreen(_createAdvancedSearchStateManager());
  _i72.AdvancedSearchStateManager _createAdvancedSearchStateManager() =>
      _i72.AdvancedSearchStateManager(_createSearchService());
  _i73.SettingModule _createSettingModule() =>
      _i73.SettingModule(_createSettingsScreen());
  _i74.SettingsScreen _createSettingsScreen() => _i74.SettingsScreen(
      _createAuthService(),
      _createAppThemeDataService(),
      _createLocalizationService());
  _i75.NotificationModule _createNotificationModule() =>
      _i75.NotificationModule(_createNotificationScreen());
  _i76.ProfileModule _createProfileModule() =>
      _i76.ProfileModule(_createProfileScreen(), _createEditProfileScreen());
  _i77.ProfileScreen _createProfileScreen() =>
      _i77.ProfileScreen(_createProfileStateManager());
  _i78.ProfileStateManager _createProfileStateManager() =>
      _i78.ProfileStateManager(_createProfileService(), _createAuthService());
  _i79.ProfileService _createProfileService() =>
      _i79.ProfileService(_createProfileManager(), _createImageUploadService());
  _i80.ProfileManager _createProfileManager() =>
      _i80.ProfileManager(_createProfileRepository());
  _i81.ProfileRepository _createProfileRepository() =>
      _i81.ProfileRepository(_createApiClient(), _createAuthService());
  _i82.EditProfileScreen _createEditProfileScreen() =>
      _i82.EditProfileScreen(_createEditProfileStateManager());
  _i83.EditProfileStateManager _createEditProfileStateManager() =>
      _i83.EditProfileStateManager(
          _createProfileService(), _createAuthService());
  _i84.HistoryModule _createHistoryModule() =>
      _i84.HistoryModule(_createHistoryScreen());
  @override
  _i6.MyApp get app => _createMyApp();
}
