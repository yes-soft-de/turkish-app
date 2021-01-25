import 'package:flutter/material.dart';
import 'package:hersay/module_theme/persistance/theme_preferences_helper.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

@provide
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
  PublishSubject<ThemeData>();
  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return Color(0xFF3ACCE1);
  }

  static Color get themeColor {
    return Color(0xff517197);
  }

  static Color get secondaryColor {
    return Color(0xff36485D);
  }

  static Color get backgroundColor {
    return Color(0xffEFEFEF);
  }


  static Color get PrimaryDarker {
    return Color(0xFF665EFF);
  }

  static Color get AccentColor {
    return Color(0xFFBE1E2D);
  }

  Future<ThemeData> getActiveTheme() async {
    var dark = await _preferencesHelper.isDarkMode();
    if (dark == true) {
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        primaryColorDark: PrimaryDarker,
        accentColor: AccentColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black,
        ),
      );
    }
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryDarker,
      accentColor: AccentColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.white,
      ),
    );
  }

  Future<void> switchDarkMode(bool darkMode) async {
    if (darkMode) {
      await _preferencesHelper.setDarkMode();
    } else {
      await _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}