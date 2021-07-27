
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hersay/module_auth/enumes/auth_source.dart';

class AppUser {
  UserCredential credential;
  AuthSource authSource;

  AppUser(this.credential, this.authSource ,);
}