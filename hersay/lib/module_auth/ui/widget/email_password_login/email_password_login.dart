
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class EmailPasswordLoginForm extends StatefulWidget {
  final bool loading;
  final Function(String, String) onLoginRequest;
  final String email;
  final String password;

  EmailPasswordLoginForm({
    this.loading,
    this.onLoginRequest,
    this.email,
    this.password,
  });

  @override
  _EmailPasswordLoginFormState createState() => _EmailPasswordLoginFormState();
}

class _EmailPasswordLoginFormState extends State<EmailPasswordLoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _loginEmailController = TextEditingController();

  final TextEditingController _loginPasswordController =
  TextEditingController();

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    print('${widget.email} : ${widget.password}');
    _loginEmailController.text = widget.email;
    _loginPasswordController.text = widget.password;

    return Form(
      key: _loginFormKey,
      autovalidate: _autoValidate,
      child: Container(
        color: ProjectColors.THEME_COLOR,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 50, bottom: 0),
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


            Card(
              elevation: 10,
              margin: EdgeInsets.only(top:20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                child: TextFormField(
                  controller: _loginEmailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
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
                      return S.of(context).pleaseEnterYourEmail;
                    }
                    return null;
                  },
                ),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.only(top:20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                child: TextFormField(
                  controller: _loginPasswordController,
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
                      return S.of(context).passwordShouldBeAtLeastFiveChar;
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
                  Navigator.of(context)
                      .pushNamed(AuthorizationRoutes.REGISTER_SCREEN);
                },
                child: Text(
                  widget.loading
                      ? /* S.of(context).loading*/ S.of(context).loading
                      : S.of(context).createNewAccount,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 30),
              height: 55,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                //TODO : change this to theme service
                color: ProjectColors.SECONDARY_COLOR,
                onPressed: widget.loading == true
                    ? null
                    : () {
                  if (_loginFormKey.currentState.validate()) {
                    widget.onLoginRequest(
                      _loginEmailController.text,
                      _loginPasswordController.text,
                    );
                  }
//
                },
                child: Text(
                  S.of(context).login,
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