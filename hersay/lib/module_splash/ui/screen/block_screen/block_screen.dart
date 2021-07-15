import 'package:flutter/material.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:inject/inject.dart';

@provide
class BlockScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.THEME_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(Icons.warning,color: Colors.white,size: 135,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sorry you can't use our app because you rejected our end user terms",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
