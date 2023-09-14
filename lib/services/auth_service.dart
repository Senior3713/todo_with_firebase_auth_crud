import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthService {
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseStorage get storage => FirebaseStorage.instance;

  static Future<bool> signUp(String email, String password, BuildContext context) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user != null;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user;
    } catch (e) {
      debugPrint("Error: $e");
    }
    return null;
  }

  static Future<void> logOut() async {
    await auth.signOut();
  }
}
