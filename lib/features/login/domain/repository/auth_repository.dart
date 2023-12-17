import 'package:coin_master/features/login/domain/entities/auth_user.dart';

abstract interface class AuthRepository {
  Stream<AuthUser> get authUserStream;
  Future<AuthUser> signIn({required String email, required String password});
  Future<AuthUser> signUp({required String email, required String password});
  Future<void> signOut();
}
