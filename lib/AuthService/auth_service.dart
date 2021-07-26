// firebase auth service
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthAction {
  Future<User?> currentUser();
  Future<User?> userLogout();
  Future<User?> createUser(email, password);
  Future<User?> signInUser(email, password);
}

class AuthService implements AuthAction {
  User? user;
  late UserCredential? userCredential;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> currentUser() async {
    try {
      user = await firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    return user;
  }

  Future<User?> userLogout() async {
    try {
      // await firebaseAuth.signOut();
      // user = await firebaseAuth.currentUser;

      // if (user != null) {
      //   await firebaseAuth.signOut();
      // }

      // return user;

      await firebaseAuth.signOut();

      user = null;
    } catch (e) {
      print(e);
    }
  }

  Future<User?> createUser(email, password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((currUser) {
        user = currUser.user;
      });
    } on FirebaseAuthException catch (e) {
      // debugPrint(e.message);
      debugPrint(e.message);
    }

    return user;
  }

  Future<User?> signInUser(email, password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
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

    return user;
  }
}
