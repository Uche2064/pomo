// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomo/app/modules/auth/models/user_account.dart';
import 'package:pomo/core/exceptions/custom_firebase_exception.dart';
import 'package:pomo/core/exceptions/custom_plateform_exception.dart';
import 'package:pomo/core/exceptions/firebase_auth_exceptions_messages.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signin with email and password;
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // register user

  Future<UserAccount?> signupUserWithEmailAndPassword(
      UserAccount user, String password) async {
    try {
      // create auth account
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: password,
      );

      user.uid = result.user!.uid;
      // save user records to firestore
      saveUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // google signin

  Future<UserCredential?> googleSignIn() async {
    try {
      // Initier le flow d'authentification
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      // recupération des info de l'utilisateur
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      // creations des identifiants

      OAuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      printInfo(info: credentials.toString());
      // Sign in with Firebase
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  Stream<UserAccount?> fetchCurrentUser() async* {
    try {
      final User? currentUser = await _auth.currentUser;
      if (currentUser == null) {
        yield null;
      }
      final DocumentSnapshot document = await _firestore
          .collection('user_account')
          .doc(currentUser?.uid)
          .get();

      yield UserAccount.fromFirestore(document);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      printInfo(info: e.toString());
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      printInfo(info: e.toString());

      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // save user records
  Future<UserAccount?> saveUser(UserAccount user) async {
    try {
      await _firestore
          .collection('user_account')
          .doc(user.uid)
          .set(user.toJson(), SetOptions(merge: true));

      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionsMessages(e.code).getMessage();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }
}
