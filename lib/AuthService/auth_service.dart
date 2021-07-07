// firebase auth service
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthAction {
  Future<User?> signInAnon();
}

class AuthService implements AuthAction {
  late final User? user;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInAnon() async {
    try {
      user = await firebaseAuth.signInAnonymously().then((userValue) {
        user = userValue.user;
      });
    } catch (e) {
      print(e);
    }
    return user;
  }
}
