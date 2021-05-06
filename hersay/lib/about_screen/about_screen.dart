import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inject/inject.dart';

@provide
class AboutScreen extends StatelessWidget {
  Future<String> getText() async {
    return await rootBundle.loadString('assets/text/about.txt');
  }

  @override
  Widget build(BuildContext context) {
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
              future: getText(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.end,
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