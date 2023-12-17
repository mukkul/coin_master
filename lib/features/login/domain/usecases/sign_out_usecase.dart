import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/shared/domain/usecases/base_usecases.dart';

class SignOutUseCase extends UseCase<void, NoParams>{
  final AuthRepository authRepository;
  SignOutUseCase({
    required this.authRepository,
  });
  @override
  Future<void> call(NoParams params) async {
    try{
      await authRepository.signOut();
    }catch (error){
      throw Exception(error);
    }
  }
  
}