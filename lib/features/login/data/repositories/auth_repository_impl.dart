import 'package:coin_master/features/login/data/datasources/auth_local_darasource.dart';
import 'package:coin_master/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Stream<AuthUser> get authUserStream {
    //Return a stream of ENTITIES and as I map them I cache them
    return remoteDatasource.user.map((authUserModel) {
      //I write inside the local cache
      localDatasource.write(key: 'user', value: authUserModel);
      //an entity is NOT NULL so if a null userModel arrives I map it
      //in an EMPTY entity.
      return authUserModel == null ? AuthUser.empty : authUserModel.toEntity();
    });
  }

  @override
  Future<AuthUser> signIn(
      {required String email, required String password}) async {
    final authUserModel = await remoteDatasource.signInWithEmailAndPassword(
        email: email, password: password);
    localDatasource.write(key: 'user', value: authUserModel);
    return authUserModel.toEntity();
  }

  @override
  Future<AuthUser> signUp(
      {required String email, required String password}) async {
    final authUserModel = await remoteDatasource.signUpWithEmailAndPassword(
        email: email, password: password);
    localDatasource.write(key: 'user', value: authUserModel);
    return authUserModel.toEntity();
  }

  @override
  Future<void> signOut() async {
    await remoteDatasource.signOut();
    localDatasource.write(key: 'user', value: null);
  }
}
