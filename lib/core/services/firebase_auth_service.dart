import 'dart:developer';
import 'package:user_online_shop/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in FirebaseAuthService.deleteUser: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'The email address or password is wrong.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(
            message: 'The user account has been disabled by an administrator.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()} and code: ${e.code}');
      if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(facebookCredential);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook: ${e.toString()} and code: ${e.code}');
      if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    // الحصول على المستخدم الحالي
    try {
      final user = FirebaseAuth.instance.currentUser;

      // إنشاء بيانات اعتماد لإعادة المصادقة
      final cred = EmailAuthProvider.credential(
          email: user?.email ?? '', password: currentPassword);

      // إعادة المصادقة
      await user?.reauthenticateWithCredential(cred);

      // تغيير كلمة المرور
      await user?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.changePassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'Current password is wrong.');
      } else if (e.code == 'requires-recent-login') {
        throw CustomException(message: 'Please re-authenticate.');
      } else if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else {
        throw CustomException(
            message: 'Something went wrong. Please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.changePassword: ${e.toString()}');
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  }


Future<void> updateEmail(String newEmail) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.verifyBeforeUpdateEmail(newEmail);
      // This will send a verification email to the new email address
    } else {
      throw CustomException(message: 'No user is currently signed in.');
    }
  } on FirebaseAuthException catch (e) {
    log('Exception in FirebaseAuthService.updateEmail: ${e.toString()} and code: ${e.code}');
    if (e.code == 'invalid-email') {
      throw CustomException(message: 'The email address is not valid.');
    } else if (e.code == 'email-already-in-use') {
      throw CustomException(message: 'This email is already registered.');
    } else if (e.code == 'requires-recent-login') {
      throw CustomException(
          message: 'Please log in again before updating your email.');
    } else if (e.code == 'network-request-failed') {
      throw CustomException(message: 'Please check your internet connection.');
    } else {
      throw CustomException(
          message: 'Something went wrong. Please try again later.');
    }
  } catch (e) {
    log('Exception in FirebaseAuthService.updateEmail: ${e.toString()}');
    throw CustomException(
        message: 'Something went wrong. Please try again later.');
  }
}
}
