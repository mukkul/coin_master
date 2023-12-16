import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/features/login/domain/value_objects/email.dart';
import 'package:coin_master/features/login/domain/value_objects/password.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class SignUpUseCase extends UseCase<AuthUser, SignUpParams> {
  final AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });

  @override
  Future<AuthUser> call(SignUpParams params) async {
    try {
      return await authRepository.signUp(
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

class SignUpParams extends Params {
  final Email email;
  final Password password;

  SignUpParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
