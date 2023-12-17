import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/features/login/domain/value_objects/email.dart';
import 'package:coin_master/features/login/domain/value_objects/password.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class SignInUseCase extends UseCase<AuthUser, SignInParams> {
  final AuthRepository authRepository;
  SignInUseCase({
    required this.authRepository,
  });

  @override
  Future<AuthUser> call(SignInParams params) async {
    try {
      return await authRepository.signIn(
        email: params.email.value,
        password: params.password.value,
      );
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class SignInParams extends Params {
  final Email email;
  final Password password;
  SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
