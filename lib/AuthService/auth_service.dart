// firebase auth service
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthAction {
  Future<User?> signInAnon();
  Future<User?> currentUser();
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

  Future<User?> currentUser() async {
    try {
      user = await firebaseAuth.currentUser;
    } catch (e) {
      print(e);
    }

    return user;
  }
}
