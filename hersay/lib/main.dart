import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hersay/main_screen/main_module.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_auth/auth_module.dart';
import 'package:hersay/module_chat/chat_module.dart';
import 'package:hersay/module_history/history_module.dart';
import 'package:hersay/module_home/home_module.dart';
import 'package:hersay/module_home/home_routes.dart';
import 'package:hersay/module_profile/Profile_module.dart';
import 'package:hersay/module_search/search_module.dart';
import 'package:hersay/module_search/search_routes.dart';
import 'package:hersay/module_settings/settings_module.dart';
import 'package:hersay/module_splash/splash_routes.dart';
import 'package:inject/inject.dart';
import 'abstracts/module/yes_module.dart';
import 'di/components/app.component.dart';
import 'generated/l10n.dart';
import 'module_localization/service/localization.service.dart';
import 'module_notification/notification_module.dart';
import 'module_products/products_module.dart';
import 'module_report/report_module.dart';
import 'module_splash/splash_module.dart';
import 'module_theme/service/theme.service.dart';
import 'package:timeago/timeago.dart' as timeago;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  //await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    final container = await AppComponent.create();
    runApp(container.app);
  });
}

@provide
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final AuthorizationModule _authorizationModule;
  final ProductsModule _productsModule;
  final SplashModule _splashModule;
  final MainModule _mainModule;
  final HomeModule _homeModule;
  final SearchModule _searchModule;
  final SettingModule _settingModule;
  final NotificationModule _notificationModulel;
  final ProfileModule _profileModule;
  final HistoryModule _historyModule;
  final ChatModule _chatModule;
  final ReportModule _reportModule;

  MyApp(
      this._themeDataService,
      this._localizationService,
      this._authorizationModule,
      this._productsModule,
      this._splashModule,
      this._mainModule,
      this._homeModule,
      this._searchModule,
      this._settingModule,
      this._notificationModulel,
      this._profileModule,
      this._historyModule,
      this._chatModule,
      this._reportModule,
      );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  String lang;
  ThemeData activeTheme;


  @override
  void initState() {
    super.initState();
    widget._localizationService.localizationStream.listen((event) {
      setState(() {});
    });

    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: ThemeData.light(),
      future: widget._themeDataService.getActiveTheme(),
      builder: (BuildContext context, AsyncSnapshot<ThemeData> themeSnapshot) {
        return FutureBuilder(
            initialData: 'tr',
            future: widget._localizationService.getLanguage(),
            builder:
                (BuildContext context, AsyncSnapshot<String> langSnapshot) {
              return getConfiguratedApp(
                YesModule.RoutesMap,
                themeSnapshot.data,
                langSnapshot.data,
              );
            });
      },
    );
  }

  Widget getConfiguratedApp(
      Map<String, WidgetBuilder> fullRoutesList,
      ThemeData theme,
      String activeLanguage,
      ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      locale: Locale.fromSubtags(
        languageCode: activeLanguage,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Hersey',
      routes: fullRoutesList,
      initialRoute: MainRoutes.MAIN_SCREEN_ROUTE,
    );
  }
}



