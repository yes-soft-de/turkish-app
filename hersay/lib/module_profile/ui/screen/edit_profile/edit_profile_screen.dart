
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/state_manager/edit_profile/edit_profile.state_manager.dart';
import 'package:hersay/module_profile/ui/state/edit_profile/edit_profile.state.dart';
import 'package:hersay/module_upload/service/image_upload/image_upload_service.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inject/inject.dart';

@provide
class EditProfileScreen extends StatefulWidget {
  final EditProfileStateManager _stateManager;



  EditProfileScreen(
      this._stateManager,
      );

  @override
  State<StatefulWidget> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController() ;
  EditProfileState currentState;

  String _errorMsg;
  bool loading = false;
  String userImage;

  String userImageUrl;

  String initialName;


  @override
  void initState() {
    super.initState();

    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if(this.mounted){
        setState(() {

        });
      }
    });
  }

  void refresh(String userName,String image){

    currentState =  EditProfileStateInit(this,userName ,image: image);

  }

  void goBackToProfile(){
    Navigator.pushReplacementNamed(
        context,
        ProfileRoutes.PROFILE_SCREEN
    );
  }

  void updateProfile(String userName,String imagePath){
     widget._stateManager.updateProfile(userName, imagePath, this);
  }

  @override
  Widget build(BuildContext context) {
    initialName = ModalRoute.of(context).settings.arguments;

    currentState = EditProfileStateInit(this,initialName);


    return Scaffold(
      body: currentState.getUI(context),
    );
  }

  Widget _getProfileEditScreen() {
    return Form(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          MediaQuery.of(context).viewInsets.bottom != 0
              ? Container()
              : Container(
            height: 375,
            child: Stack(
              children: [
                 Positioned.fill(
                    child: Container(
                        color: ProjectColors.THEME_COLOR,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  ImagePicker ip = ImagePicker();
                                  ip
                                      .getImage(source: ImageSource.gallery)
                                      .then((value) {
                                    if (value != null) {
                                      userImage = value.path;
                                      print('userImage image picked');
                                      setState(() {

                                      });

                                    }
                                  });
                                },
                                child: userImage == null ? Text(
                                  S.of(context).selectAnImage,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ):
                                Image.file(
                                  File(userImage),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        )
                    ))

              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: S.of(context).name,
                  hintText: S.of(context).name,
                ),
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value)=> _nameController.text = value,
                validator: (v) {
                  if (v.isEmpty) {
                    return S.of(context).pleaseProvideYourName;
                  }
                  return null;
                }),
          ),

          _errorMsg != null ? Text(_errorMsg) : Container(),
          Container(
            height: 50,
            decoration: BoxDecoration(color: ProjectColors.THEME_COLOR),
            child: GestureDetector(
              onTap: () {
                if (_nameController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: S.of(context).pleaseGiveUsYourName);
                  return null;
                }


                loading = true;
                if (mounted) setState(() {});
//                widget.stateManager.saveProfile(
//                  _nameController.text.trim(),
//                  userImage,
//                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      loading == false
                          ? S.of(context).saveProfile
                          : S.of(context).loading,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
