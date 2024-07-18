/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';

class Userlogin {
  Future<String> getUserSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'User Logged In';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not valid.';
      } else if (e.code == 'user-disabled') {
        return 'The user account has been disabled.';
      } else if (e.code == 'too-many-requests') {
        return 'Too many attempts to sign in. Please try again later.';
      } else if (e.code == 'operation-not-allowed') {
        return 'Email/password sign-in is not enabled.';
      }
      return 'An unknown error occurred: ${e.message}';
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  Future<String> createUserWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return 'User registered successfully';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'weak-password':
          return 'The password provided is too weak.';
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled.';
        case 'network-request-failed':
          return 'Network error occurred.';
        default:
          return 'An undefined Error happened: ${e.message}';
      }
    } catch (e) {
      print('An unexpected error occurred: $e');
      return 'An unexpected error occurred: $e';
    }
  }

  Future<bool> fetchAndSaveUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('UserData')
          .doc(user.uid)
          .get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      if (userData != null) {
        var box = Hive.box('UserData');
        box.put('data', userData);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String? getCurrentUserId() {
    User? user = auth.currentUser;
    return user?.uid;
  }
}
