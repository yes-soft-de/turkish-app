import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_auth/service/auth/auth.service.dart';
import 'package:hersay/module_localization/service/localization.service.dart';
import 'package:hersay/module_navigation/ui/widget/navigation_drawer/anime_navigation_drawer.dart';
import 'package:hersay/module_settings/ui/screen/general_settings/general_settings_screen.dart';
import 'package:hersay/module_settings/ui/screen/notification_settings/notification_settings_screen.dart';
import 'package:hersay/module_settings/ui/screen/privacy_settings/privacy_settings_screen.dart';
import 'package:hersay/module_theme/service/theme.service.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/icon_text/icon_text_widget.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class SettingsScreen extends StatefulWidget {
  final AuthService _authService;
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;

  SettingsScreen(
      this._authService,
      this._themeDataService,
      this._localizationService,
      );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _screenUi();
  }

  Widget _screenUi() {
    return Scaffold(
      key: _scaffoldKey,
      drawer: TurkishNavigationDrawer(),
      appBar: TurkishAppBar.getTurkishAppBar(context, _scaffoldKey, S.of(context).settings),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: ProjectColors.SECONDARY_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Text(
                      'Zolfekar Seleten',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            //general setting
            /*GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GeneralSettingsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: IconTextWidget(
                  icon: Icons.settings,
                  text: S.of(context).general,
                ),
              ),
            ),

            // privacy setting
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacySettingsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: IconTextWidget(
                  icon: Icons.security,
                  text: S.of(context).privacy,
                ),
              ),
            ),
            //notification setting
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettingsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: IconTextWidget(
                  icon: Icons.notifications,
                  text: S.of(context).notification,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: IconTextWidget(
                icon: Icons.help,
                text: S.of(context).help,
              ),
            ),*/
            //dark mode
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).darkMode),
                      Switch(
                          value: Theme.of(context).brightness == Brightness.dark,
                          onChanged: (mode) {
                            widget._themeDataService
                                .switchDarkMode(mode)
                                .then((value) {});
                          })
                    ],
                  ),
                ),
              ),
            ),
            //language
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).language),
                      FutureBuilder(
                        future: widget._localizationService.getLanguage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          return DropdownButton(
                              value: snapshot.data,
                              items: [
                                DropdownMenuItem(
                                  child: Text('العربية'),
                                  value: 'ar',
                                ),
                                DropdownMenuItem(
                                  child: Text('English'),
                                  value: 'en',
                                ),
                              ],
                              onChanged: (String newLang) {
                                widget._localizationService.setLanguage(newLang);
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: widget._authService.isLoggedIn,
                    initialData: false,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.data) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).signOut),
                            IconButton(
                                icon: Icon(Icons.power_settings_new),
                                onPressed: () {
                                  widget._authService.logout().then((value) {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AuthorizationRoutes.LOGIN_SCREEN,
                                            (route) => false);
                                  });
                                })
                          ],
                        );
                      } else {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).login),
                            IconButton(
                                icon: Icon(Icons.power_settings_new),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      AuthorizationRoutes.LOGIN_SCREEN);
                                })
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
