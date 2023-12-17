import 'package:coin_master/utils/ui/common_ui_elements.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  LoginController._();
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          CommonUIElements.showErrorSnackBar(
            error: 'The account already exists with a different credential',
          );
        } else if (e.code == 'invalid-credential') {
          CommonUIElements.showErrorSnackBar(
            error: 'Error occurred while accessing credentials. Try again.',
          );
        }
      } catch (e) {
        CommonUIElements.showErrorSnackBar(
          error: 'Error occurred using Google Sign In. Try again.',
        );
      }
    }

    return user;
  }
}
