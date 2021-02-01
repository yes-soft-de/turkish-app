
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/module_profile/ui/screen/edit_profile/edit_profile_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:image_picker/image_picker.dart';



abstract class EditProfileState {
  final EditProfileScreenState screenState;

  EditProfileState(this.screenState);

  Widget getUI(BuildContext context);
}

class EditProfileStateInit extends EditProfileState {
  EditProfileStateInit(EditProfileScreenState screenState , String initialName,{String image}) : super(screenState){
    _nameController.text = initialName;
    if(image !=null ){
      userImage = image;
    }
  }

  TextEditingController _nameController = TextEditingController() ;

  String _errorMsg;
  bool loading = false;
  String userImage;


  String initialName;
  
  @override
  Widget getUI(BuildContext context) {

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
                                      screenState.refresh(_nameController.text.trim(),userImage);

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
               
                screenState.updateProfile(
                  _nameController.text.trim(),
                  userImage,
                );
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

class EditProfileStateLoading extends EditProfileState {
  EditProfileStateLoading(EditProfileScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class EditProfileStateUnauthorized extends EditProfileState {
  EditProfileStateUnauthorized(EditProfileScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationRoutes.LOGIN_SCREEN, (r) => false);
    });
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class EditProfileStateSuccess extends EditProfileState {

  EditProfileStateSuccess( EditProfileScreenState screenState  )
      : super(screenState);
  
  @override
  Widget getUI(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Text(
          S.of(context).profileUpdatedSuccessfully
        ),
      ),
    );
  }


}

class EditProfileStateError extends EditProfileState {
  final String errorMsg;

  EditProfileStateError(this.errorMsg, EditProfileScreenState screenState)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Text('${errorMsg}'),
    );
  }
}