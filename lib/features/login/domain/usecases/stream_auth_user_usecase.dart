import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';

class StreamAuthUserUseCase {
  final AuthRepository authRepositories;
  StreamAuthUserUseCase({required this.authRepositories});

  Stream<AuthUser> call() {
    try {
      return authRepositories.authUserStream;
    } catch (error) {
      throw Exception(error);
    }
  }
}
