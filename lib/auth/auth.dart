import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _refAuth = FirebaseAuth.instance;

  String getUid() {
    return _refAuth.currentUser!.uid;
  }
}
