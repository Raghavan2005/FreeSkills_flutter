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

import '../../../main.dart';

class Userdatapack {
  FirebaseFirestore db;
  String databasename = "UserData";

  Userdatapack() : db = FirebaseFirestore.instance;

  String? getCurrentUserId() {
    User? user = auth.currentUser;
    return user?.uid;
  }

  Future<bool> isEmailInFirestore(String email) async {
    try {
      QuerySnapshot querySnapshot = await db
          .collection(databasename)
          .where('email', isEqualTo: email)
          .get();

      // If the querySnapshot is not empty, the email exists
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      // Handle errors as needed
      print('Error checking email: $e');
      return false;
    }
  }

  Future<bool> addUserData(Map<String, dynamic> data) async {
    try {
      String? uid = getCurrentUserId();
      await db.collection(databasename).doc(uid).set(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
