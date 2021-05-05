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
import '../../module_profile/service/profile/profile.service.dart' as _i18;
import '../../module_profile/manager/profile/profile.manager.dart' as _i19;
import '../../module_profile/repository/profile/profile.repository.dart'
    as _i20;
import '../../module_upload/service/image_upload/image_upload_service.dart'
    as _i21;
import '../../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../../module_upload/repository/upload_repository/upload_repository.dart'
    as _i23;
import '../../module_profile/presistance/profile_shared_preferences.dart'
    as _i24;
import '../../module_auth/ui/screen/register/register_screen.dart' as _i25;
import '../../module_auth/state_manager/register/register.state_manager.dart'
    as _i26;
import '../../module_products/ui/screen/add_real_estate/add_real_estate_screen.dart'
    as _i27;
import '../../module_products/state_manager/real_estate/add_real_estate.manager.dart'
    as _i28;
import '../../module_products/service/real_estate/real_estate.service.dart'
    as _i29;
import '../../module_products/manager/real_estate/real_estate.manager.dart'
    as _i30;
import '../../module_products/repository/real_estate/real_estate.repository.dart'
    as _i31;
import '../../module_products/ui/screen/add_car/add_car_sceen.dart' as _i32;
import '../../module_products/state_manager/car/add_car.state_manager.dart'
    as _i33;
import '../../module_products/service/car/car.service.dart' as _i34;
import '../../module_products/manager/car/car.manager.dart' as _i35;
import '../../module_products/repository/car/car.repository.dart' as _i36;
import '../../module_products/ui/screen/add_electronic_device/add_electronic_device_screen.dart'
    as _i37;
import '../../module_products/state_manager/electroinic_device/add_electronic_device.state_manager.dart'
    as _i38;
import '../../module_products/service/electronic_device/electronic_device.service.dart'
    as _i39;
import '../../module_products/manager/electronic_device/electronic_device.manager.dart'
    as _i40;
import '../../module_products/repository/electonic_device/electronic_device.repository.dart'
    as _i41;
import '../../module_products/ui/screen/add_service/add_service_screen.dart'
    as _i42;
import '../../module_products/state_manager/service/add_service_state_manager.dart'
    as _i43;
import '../../module_products/service/service/service.dart' as _i44;
import '../../module_products/manager/service/service_manager.dart' as _i45;
import '../../module_products/repository/service/service_repository.dart'
    as _i46;
import '../../module_products/ui/screen/electronic_device_details/electronic_device_details_screen.dart'
    as _i47;
import '../../module_products/state_manager/electroinic_device/electronic_device_details.state_manager.dart'
    as _i48;
import '../../module_chat/service/chat/char_service.dart' as _i49;
import '../../module_chat/manager/chat/chat_manager.dart' as _i50;
import '../../module_chat/repository/chat/chat_repository.dart' as _i51;
import '../../module_reaction/service/reaction.service.dart' as _i52;
import '../../module_reaction/manager/reaction.manager.dart' as _i53;
import '../../module_reaction/repository/reaction.repository.dart' as _i54;
import '../../module_products/ui/screen/real_estate_details/real_estate_details_screen.dart'
    as _i55;
import '../../module_products/state_manager/real_estate/real_estate_details.state_manager.dart'
    as _i56;
import '../../module_products/ui/screen/car_details/car_details_screen.dart'
    as _i57;
import '../../module_products/state_manager/car/car_details.state_manager.dart'
    as _i58;
import '../../module_report/service/report_service.dart' as _i59;
import '../../module_report/manager/report_manager.dart' as _i60;
import '../../module_report/repository/report_repository.dart' as _i61;
import '../../module_products/ui/screen/product_images/product_images_screen.dart'
    as _i62;
import '../../module_products/ui/screen/service_details/service_details.dart'
    as _i63;
import '../../module_products/state_manager/service/service_details.state_manager.dart'
    as _i64;
import '../../module_splash/splash_module.dart' as _i65;
import '../../module_splash/ui/screen/splash_screen/splash_screen.dart' as _i66;
import '../../main_screen/main_module.dart' as _i67;
import '../../main_screen/ui/main_screen.dart' as _i68;
import '../../module_home/ui/sceen/home/home_screen.dart' as _i69;
import '../../module_home/state_manager/home/home.state_manager.dart' as _i70;
import '../../module_home/service/home/home.service.dart' as _i71;
import '../../module_home/manager/home/home.manager.dart' as _i72;
import '../../module_home/repository/home/home.repository.dart' as _i73;
import '../../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i74;
import '../../module_chat/state_manager/chats_list/chat_list.state_manger.dart'
    as _i75;
import '../../module_history/ui/screen/history/history_screen.dart' as _i76;
import '../../module_history/state_manager/history/history.state_manger.dart'
    as _i77;
import '../../module_history/service/history/history.service.dart' as _i78;
import '../../module_history/manager/history/history.manager.dart' as _i79;
import '../../module_history/repository/history/history.reppsitory.dart'
    as _i80;
import '../../module_notification/ui/screen/notifications/notification_screen.dart'
    as _i81;
import '../../module_notification/state_manager/notification/notification.state_manger.dart'
    as _i82;
import '../../module_notification/service/notification/notification.service.dart'
    as _i83;
import '../../module_notification/manager/notification/notification.manager.dart'
    as _i84;
import '../../module_notification/repository/notification/notification.reppsitory.dart'
    as _i85;
import '../../about_screen/about_screen.dart' as _i86;
import '../../module_home/home_module.dart' as _i87;
import '../../module_search/search_module.dart' as _i88;
import '../../module_search/ui/screen/search_screen/seach_screen.dart' as _i89;
import '../../module_search/state_manager/search/search.state_manager.dart'
    as _i90;
import '../../module_search/service/search/search.service.dart' as _i91;
import '../../module_search/manager/search/search.manager.dart' as _i92;
import '../../module_search/repository/search.repository.dart' as _i93;
import '../../module_search/ui/screen/advanced_search_screen/advanced_search_screen.dart'
    as _i94;
import '../../module_search/state_manager/advanced_search/advanced_search.state_manager.dart'
    as _i95;
import '../../module_settings/settings_module.dart' as _i96;
import '../../module_settings/ui/screen/settings/settings_screen.dart' as _i97;
import '../../module_notification/notification_module.dart' as _i98;
import '../../module_profile/Profile_module.dart' as _i99;
import '../../module_profile/ui/screen/profile/profile_screen.dart' as _i100;
import '../../module_profile/state_manager/profile/profile.state_manager.dart'
    as _i101;
import '../../module_profile/ui/screen/edit_profile/edit_profile_screen.dart'
    as _i102;
import '../../module_profile/state_manager/edit_profile/edit_profile.state_manager.dart'
    as _i103;
import '../../module_history/history_module.dart' as _i104;
import '../../module_chat/chat_module.dart' as _i105;
import '../../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i106;
import '../../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i107;
import '../../module_report/report_module.dart' as _i108;
import '../../module_report/ui/screen/report/report_screen.dart' as _i109;
import '../../module_report/state_manager/report.state_manager.dart' as _i110;

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
      _createHistoryModule(),
      _createChatModule(),
      _createReportModule());
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
      _i12.LoginStateManager(_createAuthService(), _createProfileService());
  _i13.AuthService _createAuthService() =>
      _i13.AuthService(_createAuthPrefsHelper(), _createAuthManager());
  _i14.AuthPrefsHelper _createAuthPrefsHelper() => _i14.AuthPrefsHelper();
  _i15.AuthManager _createAuthManager() =>
      _i15.AuthManager(_createAuthRepository());
  _i16.AuthRepository _createAuthRepository() =>
      _i16.AuthRepository(_createApiClient());
  _i17.ApiClient _createApiClient() => _i17.ApiClient(_createLogger());
  _i3.Logger _createLogger() => _singletonLogger ??= _i3.Logger();
  _i18.ProfileService _createProfileService() => _i18.ProfileService(
      _createProfileManager(),
      _createImageUploadService(),
      _createProfileSharedPreferencesHelper());
  _i19.ProfileManager _createProfileManager() =>
      _i19.ProfileManager(_createProfileRepository());
  _i20.ProfileRepository _createProfileRepository() =>
      _i20.ProfileRepository(_createApiClient(), _createAuthService());
  _i21.ImageUploadService _createImageUploadService() =>
      _i21.ImageUploadService(_createUploadManager());
  _i22.UploadManager _createUploadManager() =>
      _i22.UploadManager(_createUploadRepository());
  _i23.UploadRepository _createUploadRepository() =>
      _i23.UploadRepository(_createApiClient(), _createAuthService());
  _i24.ProfileSharedPreferencesHelper _createProfileSharedPreferencesHelper() =>
      _i24.ProfileSharedPreferencesHelper();
  _i25.RegisterScreen _createRegisterScreen() =>
      _i25.RegisterScreen(_createRegisterStateManager());
  _i26.RegisterStateManager _createRegisterStateManager() =>
      _i26.RegisterStateManager(_createAuthService(), _createProfileService());
  _i4.ProductsModule _createProductsModule() =>
      _singletonProductsModule ??= _i4.ProductsModule(
          _createAddRealEstateScreen(),
          _createAddCarScreen(),
          _createAddElectronicDeviceScreen(),
          _createAddServiceScreen(),
          _createElectronicDeviceDetailsScreen(),
          _createRealEstateDetailsScreen(),
          _createCarDetailsScreen(),
          _createProductImagesScreen(),
          _createServiceDetailsScreen());
  _i27.AddRealEstateScreen _createAddRealEstateScreen() =>
      _i27.AddRealEstateScreen(
          _createAddRealEstateStateManager(), _createAuthService());
  _i28.AddRealEstateStateManager _createAddRealEstateStateManager() =>
      _i28.AddRealEstateStateManager(_createRealEstateService());
  _i29.RealEstateService _createRealEstateService() => _i29.RealEstateService(
      _createRealEstateManager(), _createImageUploadService());
  _i30.RealEstateManager _createRealEstateManager() =>
      _i30.RealEstateManager(_createRealEstateRepository());
  _i31.RealEstateRepository _createRealEstateRepository() =>
      _i31.RealEstateRepository(_createApiClient(), _createAuthService());
  _i32.AddCarScreen _createAddCarScreen() =>
      _i32.AddCarScreen(_createAddCarStateManager(), _createAuthService());
  _i33.AddCarStateManager _createAddCarStateManager() =>
      _i33.AddCarStateManager(_createCarService());
  _i34.CarService _createCarService() =>
      _i34.CarService(_createCarManager(), _createImageUploadService());
  _i35.CarManager _createCarManager() =>
      _i35.CarManager(_createCarRepository());
  _i36.CarRepository _createCarRepository() =>
      _i36.CarRepository(_createApiClient(), _createAuthService());
  _i37.AddElectronicDeviceScreen _createAddElectronicDeviceScreen() =>
      _i37.AddElectronicDeviceScreen(
          _createAddElectronicDeviceStateManager(), _createAuthService());
  _i38.AddElectronicDeviceStateManager
      _createAddElectronicDeviceStateManager() =>
          _i38.AddElectronicDeviceStateManager(
              _createElectronicDeviceService());
  _i39.ElectronicDeviceService _createElectronicDeviceService() =>
      _i39.ElectronicDeviceService(
          _createElectronicDeviceManager(), _createImageUploadService());
  _i40.ElectronicDeviceManager _createElectronicDeviceManager() =>
      _i40.ElectronicDeviceManager(_createElectronicDeviceRepository());
  _i41.ElectronicDeviceRepository _createElectronicDeviceRepository() =>
      _i41.ElectronicDeviceRepository(_createApiClient(), _createAuthService());
  _i42.AddServiceScreen _createAddServiceScreen() => _i42.AddServiceScreen(
      _createAddServiceStateManager(), _createAuthService());
  _i43.AddServiceStateManager _createAddServiceStateManager() =>
      _i43.AddServiceStateManager(_createServiceService());
  _i44.ServiceService _createServiceService() =>
      _i44.ServiceService(_createServiceManager(), _createImageUploadService());
  _i45.ServiceManager _createServiceManager() =>
      _i45.ServiceManager(_createServiceRepository());
  _i46.ServiceRepository _createServiceRepository() =>
      _i46.ServiceRepository(_createApiClient(), _createAuthService());
  _i47.ElectronicDeviceDetailsScreen _createElectronicDeviceDetailsScreen() =>
      _i47.ElectronicDeviceDetailsScreen(
          _createElectronicDeviceDetailsStateManager(), _createAuthService());
  _i48.ElectronicDeviceDetailsStateManager
      _createElectronicDeviceDetailsStateManager() =>
          _i48.ElectronicDeviceDetailsStateManager(
              _createElectronicDeviceService(),
              _createChatService(),
              _createReactionService());
  _i49.ChatService _createChatService() =>
      _i49.ChatService(_createChatManager());
  _i50.ChatManager _createChatManager() =>
      _i50.ChatManager(_createChatRepository());
  _i51.ChatRepository _createChatRepository() =>
      _i51.ChatRepository(_createApiClient(), _createAuthService());
  _i52.ReactionService _createReactionService() =>
      _i52.ReactionService(_createReactionManager());
  _i53.ReactionManager _createReactionManager() =>
      _i53.ReactionManager(_createReactionRepository());
  _i54.ReactionRepository _createReactionRepository() =>
      _i54.ReactionRepository(_createApiClient(), _createAuthService());
  _i55.RealEstateDetailsScreen _createRealEstateDetailsScreen() =>
      _i55.RealEstateDetailsScreen(
          _createRealEstateDetailsStateManager(), _createAuthService());
  _i56.RealEstateDetailsStateManager _createRealEstateDetailsStateManager() =>
      _i56.RealEstateDetailsStateManager(_createRealEstateService(),
          _createChatService(), _createReactionService());
  _i57.CarDetailsScreen _createCarDetailsScreen() => _i57.CarDetailsScreen(
      _createCarDetailsStateManager(), _createAuthService());
  _i58.CarDetailsStateManager _createCarDetailsStateManager() =>
      _i58.CarDetailsStateManager(_createCarService(), _createChatService(),
          _createReactionService(), _createReportService());
  _i59.ReportService _createReportService() =>
      _i59.ReportService(_createReportManager());
  _i60.ReportManager _createReportManager() =>
      _i60.ReportManager(_createReportRepository());
  _i61.ReportRepository _createReportRepository() =>
      _i61.ReportRepository(_createApiClient(), _createAuthService());
  _i62.ProductImagesScreen _createProductImagesScreen() =>
      _i62.ProductImagesScreen();
  _i63.ServiceDetailsScreen _createServiceDetailsScreen() =>
      _i63.ServiceDetailsScreen(
          _createServicesDetailsStateManager(), _createAuthService());
  _i64.ServicesDetailsStateManager _createServicesDetailsStateManager() =>
      _i64.ServicesDetailsStateManager(
          _createServiceService(),
          _createChatService(),
          _createReactionService(),
          _createReportService());
  _i65.SplashModule _createSplashModule() =>
      _i65.SplashModule(_createSplashScreen());
  _i66.SplashScreen _createSplashScreen() =>
      _i66.SplashScreen(_createAuthService());
  _i67.MainModule _createMainModule() =>
      _i67.MainModule(_createMainScreen(), _createAboutScreen());
  _i68.MainScreen _createMainScreen() => _i68.MainScreen(
      _createHomeScreen(),
      _createChatsListScreen(),
      _createHistoryScreen(),
      _createNotificationScreen());
  _i69.HomeScreen _createHomeScreen() =>
      _i69.HomeScreen(_createHomeStateManager());
  _i70.HomeStateManager _createHomeStateManager() => _i70.HomeStateManager(
      _createHomeService(), _createAuthService(), _createProfileService());
  _i71.HomeService _createHomeService() =>
      _i71.HomeService(_createHomeManager());
  _i72.HomeManager _createHomeManager() =>
      _i72.HomeManager(_createHomeRepository());
  _i73.HomeRepository _createHomeRepository() =>
      _i73.HomeRepository(_createApiClient(), _createAuthService());
  _i74.ChatsListScreen _createChatsListScreen() => _i74.ChatsListScreen(
      _createChatsListStateManager(), _createAuthService());
  _i75.ChatsListStateManager _createChatsListStateManager() =>
      _i75.ChatsListStateManager(_createChatService());
  _i76.HistoryScreen _createHistoryScreen() =>
      _i76.HistoryScreen(_createHistoryStateManager(), _createAuthService());
  _i77.HistoryStateManager _createHistoryStateManager() =>
      _i77.HistoryStateManager(_createHistoryService());
  _i78.HistoryService _createHistoryService() =>
      _i78.HistoryService(_createHistoryManager());
  _i79.HistoryManager _createHistoryManager() =>
      _i79.HistoryManager(_createHistoryRepository());
  _i80.HistoryRepository _createHistoryRepository() =>
      _i80.HistoryRepository(_createAuthService(), _createApiClient());
  _i81.NotificationScreen _createNotificationScreen() =>
      _i81.NotificationScreen(
          _createNotificationStateManager(), _createAuthService());
  _i82.NotificationStateManager _createNotificationStateManager() =>
      _i82.NotificationStateManager(_createNotificationService());
  _i83.NotificationService _createNotificationService() =>
      _i83.NotificationService(_createNotificationManager());
  _i84.NotificationManager _createNotificationManager() =>
      _i84.NotificationManager(_createNotificationRepository());
  _i85.NotificationRepository _createNotificationRepository() =>
      _i85.NotificationRepository(_createAuthService(), _createApiClient());
  _i86.AboutScreen _createAboutScreen() => _i86.AboutScreen();
  _i87.HomeModule _createHomeModule() => _i87.HomeModule(_createHomeScreen());
  _i88.SearchModule _createSearchModule() =>
      _i88.SearchModule(_createSearchScreen(), _createAdvancedSearchScreen());
  _i89.SearchScreen _createSearchScreen() =>
      _i89.SearchScreen(_createSearchStateManager());
  _i90.SearchStateManager _createSearchStateManager() =>
      _i90.SearchStateManager(_createSearchService());
  _i91.SearchService _createSearchService() =>
      _i91.SearchService(_createSearchManager());
  _i92.SearchManager _createSearchManager() =>
      _i92.SearchManager(_createSearchRepository());
  _i93.SearchRepository _createSearchRepository() =>
      _i93.SearchRepository(_createApiClient(), _createAuthService());
  _i94.AdvancedSearchScreen _createAdvancedSearchScreen() =>
      _i94.AdvancedSearchScreen(_createAdvancedSearchStateManager());
  _i95.AdvancedSearchStateManager _createAdvancedSearchStateManager() =>
      _i95.AdvancedSearchStateManager(
          _createSearchService(), _createServiceService());
  _i96.SettingModule _createSettingModule() =>
      _i96.SettingModule(_createSettingsScreen());
  _i97.SettingsScreen _createSettingsScreen() => _i97.SettingsScreen(
      _createAuthService(),
      _createAppThemeDataService(),
      _createLocalizationService());
  _i98.NotificationModule _createNotificationModule() =>
      _i98.NotificationModule(_createNotificationScreen());
  _i99.ProfileModule _createProfileModule() =>
      _i99.ProfileModule(_createProfileScreen(), _createEditProfileScreen());
  _i100.ProfileScreen _createProfileScreen() =>
      _i100.ProfileScreen(_createProfileStateManager(), _createAuthService());
  _i101.ProfileStateManager _createProfileStateManager() =>
      _i101.ProfileStateManager(_createProfileService(), _createAuthService());
  _i102.EditProfileScreen _createEditProfileScreen() =>
      _i102.EditProfileScreen(_createEditProfileStateManager());
  _i103.EditProfileStateManager _createEditProfileStateManager() =>
      _i103.EditProfileStateManager(
          _createProfileService(), _createAuthService());
  _i104.HistoryModule _createHistoryModule() =>
      _i104.HistoryModule(_createHistoryScreen());
  _i105.ChatModule _createChatModule() => _i105.ChatModule(
      _createChatsListScreen(), _createAuthService(), _createChatScreen());
  _i106.ChatScreen _createChatScreen() =>
      _i106.ChatScreen(_createChatPageBloc(), _createImageUploadService());
  _i107.ChatPageBloc _createChatPageBloc() =>
      _i107.ChatPageBloc(_createChatService());
  _i108.ReportModule _createReportModule() =>
      _i108.ReportModule(_createReportScreen());
  _i109.ReportScreen _createReportScreen() =>
      _i109.ReportScreen(_createReportStateManager());
  _i110.ReportStateManager _createReportStateManager() =>
      _i110.ReportStateManager(_createReportService());
  @override
  _i6.MyApp get app => _createMyApp();
}
