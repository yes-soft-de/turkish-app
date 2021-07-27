import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/main_screen/main_routes.dart';
import 'package:hersay/module_auth/auth_routes.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/route_helper/route_helper.dart';

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
  String redirectTo = MainRoutes.MAIN_SCREEN_ROUTE;
  int itemId;
  @override
  Widget build(BuildContext context) {
    RouteHelper route = ModalRoute.of(context).settings.arguments;
    final node = FocusScope.of(context);
    print('${widget.email} : ${widget.password}');
    _loginEmailController.text = widget.email;
    _loginPasswordController.text = widget.password;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(redirectTo, (route) => false);
        return true;
      },
      child: Form(
        key: _loginFormKey,
        autovalidate: _autoValidate,
        child: Container(
          color: ProjectColors.THEME_COLOR,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          redirectTo, (route) => false);
                    },
                  ),
                ),
                Container(
                  height: 8,
                ),
                route == null
                    ? Container()
                    : Text(
                        S.of(context).pleaseLogin,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                Container(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: 90,
                    width: 90,
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
                      image: AssetImage('assets/images/logo2.png'),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
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
                        onEditingComplete: () => node.nextFocus(),
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
                    margin: EdgeInsets.only(top: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
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
                            return S
                                .of(context)
                                .passwordShouldBeAtLeastFiveChar;
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          AuthorizationRoutes.REGISTER_SCREEN);
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
                  margin: EdgeInsets.only(top: 20),
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
        ),
      ),
    );
  }

  void moveToNext(var itemId, redirectTo) {
    (itemId == null)
        ? Navigator.pushNamed(context, redirectTo)
        : Navigator.pushNamed(context, redirectTo, arguments: itemId);
  }
}
