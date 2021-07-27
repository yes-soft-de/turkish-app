
import 'package:hersay/abstracts/module/yes_module.dart';
import 'package:hersay/module_splash/splash_routes.dart';
import 'package:hersay/module_splash/ui/screen/block_screen/block_screen.dart';
import 'package:hersay/module_splash/ui/screen/splash_screen/splash_screen.dart';
import 'package:inject/inject.dart';

@provide
class SplashModule extends YesModule {
  SplashModule(SplashScreen splashScreen,BlockScreen blockScreen) {
    YesModule.RoutesMap.addAll({
      SplashRoutes.SPLASH_SCREEN: (context) => splashScreen,
      SplashRoutes.BLOCK_SCREEN: (context) => blockScreen
    });
  }
}