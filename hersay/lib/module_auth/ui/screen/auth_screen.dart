import 'package:flutter/material.dart';
import 'package:hersay/main_screen/ui/main_screen.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';

class LoginScreen extends StatefulWidget {
//  final AuthStateManager _stateManager;

//  LoginScreen(this._stateManager);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  bool loginMode = false;

  bool _autoValidate = false;

//  AuthState _currentState;

  bool loading = false;

  String redirectTo;

//  @override
//  void initState() {
//    super.initState();
//
//    widget._stateManager.stateStream.listen((event) {
//      print(event.runtimeType.toString());
//      _currentState = event;
//      processEvent();
//    });
//
//  }
//
//  Future<void> isUserLoggedIn()async{
//     isUserSignedIn = await widget._stateManager.isSignedIn();
//     signedInUseIsACaptain = await widget._stateManager.isCaptain();
//  }

//  void processEvent(){
//    if (_currentState is AuthStateCaptainSuccess) {
//      redirectTo = OrdersRoutes.ORDERS_SCREEN;
//      Navigator.of(context).pushReplacementNamed(redirectTo);
//    }
//    if (_currentState is AuthStateOwnerSuccess) {
//      redirectTo = OrdersRoutes.OWNER_ORDERS_SCREEN;
//      Navigator.of(context).pushReplacementNamed(redirectTo);
//    }
//    if (_currentState is AuthStateNotRegisteredOwner) {
//      redirectTo = InitAccountRoutes.INIT_ACCOUNT_SCREEN;
//      Navigator.of(context).pushReplacementNamed(redirectTo);
//    }
//
//    if (this.mounted) {
//      setState(() {});
//    }
//  }

  @override
  Widget build(BuildContext context) {
//    isUserLoggedIn().then((value) {
//      print('is captain : $signedInUseIsACaptain');
//      if(isUserSignedIn){
//        if(signedInUseIsACaptain){
//          Future((){
//            Navigator.pushNamed(
//                context,
//                OrdersRoutes.ORDERS_SCREEN
//            );
//          });
//        }else{
//          Future((){
//            Navigator.pushNamed(
//                context,
//                OrdersRoutes.OWNER_ORDERS_SCREEN
//            );
//          });
//        }
//      }
//    });

//   widget._stateManager.isSignedIn().then((value) {
//     if (value) Navigator.of(context).pushReplacementNamed(redirectTo);
//   });

    return loginMode ? loginUi() : registerUi();
  }

  Widget registerUi() {
    final node = FocusScope.of(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _registerFormKey,
            autovalidate: _autoValidate,
            child: Container(
              color: ProjectColors.THEME_COLOR,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30, bottom: 30),
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
                        loginMode = true;
                        setState(() {});
                      },
                      child: Text(
                        loading
                            ? /*S.of(context).loading*/ 'loading'
                            : /*S.of(context).iHaveAnAccount*/ 'لدي حساب',
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
                      color: ProjectColors.SECONDARY_COLOR,
                      onPressed: loading
                          ? null
                          : () {
                              if (_registerFormKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()));
                                });

//                            widget._stateManager.registerWithoutFirebase(
//                              _registerEmailController.text.trim(),
//                              _registerPasswordController.text.trim(),
//                              _registerNameController.text.trim(),
//                              isCaptain
//                            );

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
          ),
        ),
      ),
    );
  }

  Widget loginUi() {
    final node = FocusScope.of(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _loginFormKey,
            autovalidate: _autoValidate,
            child: Container(
              color: ProjectColors.THEME_COLOR,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30, bottom: 60),
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
                        loginMode = false;
                        setState(() {});
                      },
                      child: Text(
                        loading
                            ? /* S.of(context).loading*/ 'loading'
                            : 'انشاء حساب جديد',
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
                      color: ProjectColors.SECONDARY_COLOR,
                      onPressed: loading
                          ? null
                          : () {
                              if (_loginFormKey.currentState.validate()) {
                                setState(() {
//                            loading = true;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()));
                                });

//                          widget._stateManager.loginWithoutFirebase(
//                              _loginEmailController.text.trim(),
//                              _loginPasswordController.text.trim(),
//                              isCaptain
//                          );

                              }
//
                            },
                      child: Text(
                        'Login',
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
      ),
    );
  }
}
