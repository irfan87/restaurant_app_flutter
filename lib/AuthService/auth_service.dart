// firebase auth service
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthAction {
  Future<User?> signInAnon();
  Future<User?> currentUser();
  Future<User?> userLogout();
  Future<User?> createUser();
  Future<User?> signInUser();
}

class AuthService implements AuthAction {
  late final User? user;
  late UserCredential? userCredential;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnon() async {
    try {
      user = await firebaseAuth.signInAnonymously().then((userValue) {
        user = userValue.user;
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<User?> currentUser() async {
    try {
      user = await firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    return user;
  }

  @override
  Future<User?> userLogout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<User?> createUser() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: "aaa@gmail.com", password: '123456')
          .then((currUser) {
        user = currUser.user;
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<User?> signInUser() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: "aaa@gmail.com", password: '123456')
          .then((currUser) => user = currUser.user);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
      }
      print(e.message);
    }
  }
}
