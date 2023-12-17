import 'package:coin_master/features/login/data/models/auth_user_model.dart';

abstract class AuthRemoteDatasource {
  Stream<AuthUserModel?> get user;
  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<AuthUserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
