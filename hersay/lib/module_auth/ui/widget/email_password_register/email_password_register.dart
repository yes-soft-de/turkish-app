import 'package:hersay/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class EmailPasswordRegisterForm extends StatefulWidget {
//  final bool loading;
  final Function(String, String, String) onRegisterRequest;

  EmailPasswordRegisterForm({
//    this.loading,
    this.onRegisterRequest,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordRegisterFormState();
}

class _EmailPasswordRegisterFormState extends State<EmailPasswordRegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController =
  TextEditingController();
  final TextEditingController _registerPasswordController =
  TextEditingController();

  bool _autoValidate = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final node = FocusScope.of(context);

    return  Form(
      key: _registerFormKey,
      autovalidate: _autoValidate,
      child: Container(
        //TODO : change this later to theme
        color: ProjectColors.THEME_COLOR,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 50, bottom: 30),

        child: Column(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:
                        2.0, // has the effect of softening the shadow
                        spreadRadius:
                        2.0, // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:
                        2.0, // has the effect of softening the shadow
                        spreadRadius:
                        2.0, // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: TextFormField(
                  controller: _registerNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Name',
                  ),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () =>
                      node.nextFocus(), // Move focus to next
                  validator: (result) {
                    if (result.isEmpty) {
                      return 'الرجاء ادخال اسمك';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:
                        2.0, // has the effect of softening the shadow
                        spreadRadius:
                        2.0, // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: TextFormField(
                  controller: _registerEmailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Email',
                  ),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () =>
                      node.nextFocus(), // Move focus to next
                  validator: (result) {
                    if (result.isEmpty) {
                      return 'الرجاء ادخال الإيميل الخاص بك';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius:
                      2.0, // has the effect of softening the shadow
                      spreadRadius:
                      2.0, // has the effect of extending the shadow
                      offset: Offset(
                        5.0, // horizontal, move right 10
                        5.0, // vertical, move down 10
                      ),
                    )
                  ]),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _registerPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Password',
                  ),
                  validator: (result) {
                    if (result.length < 5) {
                      return 'كلمة المرور يجب ان تكون من 5 محارف على الأقل';
                    }
                    return null;
                  },
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) =>
                      node.unfocus(), // Submit and hide keyboard
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AuthorizationRoutes.LOGIN_SCREEN);
                },
                child: Text(
                  S.of(context).iHaveAnAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),
              height: 55,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: ProjectColors.SECONDARY_COLOR,
                onPressed: /*loading
                    ? null
                    :*/ () {
                  if (_registerFormKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    widget.onRegisterRequest(
                      _registerEmailController.text.trim(),
                      _registerPasswordController.text.trim(),
                      _registerNameController.text.trim(),
                    );
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
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