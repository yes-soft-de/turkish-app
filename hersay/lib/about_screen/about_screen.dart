import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inject/inject.dart';

@provide
class AboutScreen extends StatelessWidget {
  Future<String> getText(String lang) async {
    return await rootBundle.loadString('assets/text/about_$lang.txt');
  }

  @override
  Widget build(BuildContext context) {
    String local = Localizations.localeOf(context).languageCode; 
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ProjectColors.THEME_COLOR,
        title: Text(
          S.of(context).about,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getText(local),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}
