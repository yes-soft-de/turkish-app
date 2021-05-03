import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_profile/model/profile/profile_model.dart';
import 'package:hersay/module_profile/profile_routes.dart';
import 'package:hersay/module_profile/state_manager/edit_profile/edit_profile.state_manager.dart';
import 'package:hersay/module_profile/ui/state/edit_profile/edit_profile.state.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
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
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _cityController = TextEditingController();

  TextEditingController _countryController = TextEditingController();

  EditProfileState currentState;

  bool _autoValidate = false;
  String _errorMsg;
  bool loading = false;
  String userImage;

  String userImageUrl;
  String initialImage;

  ProfileModel profile;

  @override
  void initState() {
    super.initState();

    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  void refresh(String userName, String image) {
    currentState = EditProfileStateInit(this, userName, image: image);
  }

  void goBackToProfile() {
    // Navigator.pushReplacementNamed(context, ProfileRoutes.PROFILE_SCREEN);
    Navigator.of(context).pop();
  }

  void updateProfile(
      String userName, String country, String city, String imagePath) {
    widget._stateManager
        .updateProfile(userName, country, city, imagePath, this);
  }

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    profile = ModalRoute.of(context).settings.arguments;

//    currentState = EditProfileStateInit(this,initialName);
    if (profile != null && flag) {
      initialImage = profile.userImage;
      flag = false;
    }

    return loading ? _loadingWidget() : _getProfileEditScreen();
  }

  Widget _loadingWidget() {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: ProjectColors.THEME_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).saving,
                style: TextStyle(color: Colors.white),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          )),
    );
  }

  Widget _getProfileEditScreen() {
    return Scaffold(
        appBar: TurkishAppBar.getTurkishOrdinaryAppBar(
            context, S.of(context).editAccount),
        body: SingleChildScrollView(
          child: Form(
            key: _profileFormKey,
            autovalidate: _autoValidate,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MediaQuery.of(context).viewInsets.bottom != 0
                      ? Container()
                      : Container(
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: Container(
                                      color: ProjectColors.THEME_COLOR,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                ImagePicker ip = ImagePicker();
                                                ip
                                                    .getImage(
                                                        source:
                                                            ImageSource.gallery)
                                                    .then((value) {
                                                  if (value != null) {
                                                    userImage = value.path;
                                                    print(
                                                        'userImage image picked');
//                                      screenState.refresh(_nameController.text.trim(),userImage);
                                                    setState(() {});
                                                  }
                                                });
                                              },
                                              child: userImage == null
                                                  ? CircleAvatar(
                                                      backgroundImage:
                                                          new NetworkImage(
                                                        initialImage ?? '',
                                                      ),
                                                      radius: 80.0,
                                                    )
                                                  : CircleAvatar(
                                                      backgroundImage:
                                                          new FileImage(
                                                        File(userImage),
                                                      ),
                                                      radius: 80.0,
                                                    ),
//                                Image.file(
//                                  File(userImage),
//                                  fit: BoxFit.contain,
//                                ),
                                            ),
                                          ),
                                        ],
                                      )))
                            ],
                          ),
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText:
                                S.of(context).name + ' (${profile.userName})',
                          ),
                          onChanged: (value) {
                            profile.userName = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                        ),
                        child: TextFormField(
                          controller: _countryController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.flag),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText:
                                S.of(context).country + ' (${profile.country})',
                          ),
                          onChanged: (value) {
                            profile.country = value;
                          },
                          // Move focus to next
                          validator: (result) {
                            if (result.isEmpty) {
                              return S.of(context).pleaseEnterYourEmail;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                        ),
                        child: TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText:
                                S.of(context).city + ' (${profile.city})',
                          ),
                          onChanged: (value) {
                            profile.city = value;
                          },
                          validator: (result) {
                            if (result.isEmpty) {
                              return S.of(context).pleaseEnterYourEmail;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  _errorMsg != null ? Text(_errorMsg) : Container(),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(color: ProjectColors.THEME_COLOR),
                    child: GestureDetector(
                      onTap: () {
                        loading = true;

                        updateProfile(
                          profile.userName,
                          profile.country,
                          profile.city,
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
            ),
          ),
        ));
  }
}
