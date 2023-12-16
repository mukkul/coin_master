import 'package:coin_master/features/login/data/models/auth_user_model.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:coin_master/features/login/data/datasources/auth_remote_datasource.dart';

class AuthRemoteDatasourceFirebase implements AuthRemoteDatasource {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  AuthRemoteDatasourceFirebase({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth =
            firebaseAuth ?? serviceLocator<firebase_auth.FirebaseAuth>();

  @override
  Stream<AuthUserModel?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return AuthUserModel.fromFirebaseAuthUser(firebaseUser);
    });
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      firebase_auth.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return AuthUserModel.fromFirebaseAuthUser(credential.user!);
    } catch (error) {
      throw Exception('Sign in failed: $error');
    }
  }

  @override
  Future<AuthUserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try{
      firebase_auth.UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthUserModel.fromFirebaseAuthUser(credential.user!);
    } catch (error){
      throw Exception('Sign up failed: $error');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception('Sign out failed $error');
    }
  }
}
