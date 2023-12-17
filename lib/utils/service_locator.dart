import 'package:coin_master/features/login/data/datasources/auth_local_darasource.dart';
import 'package:coin_master/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:coin_master/features/login/data/datasources/auth_remote_datasource_firebase.dart';
import 'package:coin_master/features/login/data/repositories/auth_repository_impl.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:coin_master/features/login/domain/usecases/sign_out_usecase.dart';
import 'package:coin_master/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:coin_master/features/login/domain/usecases/stream_auth_user_usecase.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_up/sign_up_cubit.dart';
import 'package:coin_master/features/theme/data/datasources/theme_local_datasource.dart';
import 'package:coin_master/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:coin_master/features/theme/domain/repositories/theme_repository.dart';
import 'package:coin_master/features/theme/domain/usecases/stream_theme_usecase.dart';
import 'package:coin_master/features/theme/domain/usecases/switch_theme_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //----------------------------- SHARED PREFERENCES ---------------------------
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(prefs);

  //------------------------------ FIREBASE ------------------------------------
  serviceLocator.registerSingleton<firebase_auth.FirebaseAuth>(
      firebase_auth.FirebaseAuth.instance);

  //------------------------------- DATA SOURCES --------------------------------

  //------ Local Auth Data -------
  serviceLocator.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasource(),
  );

  //------ Remote Auth Data ------
  serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceFirebase());

  //------ Theme -----------------
  serviceLocator.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSource(prefs: prefs));

  //-------------------------------- REPOSITORIES ------------------------------

  //------ Auth ------------------
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDatasource: serviceLocator<AuthRemoteDatasource>(),
      localDatasource: serviceLocator<AuthLocalDatasource>(),
    ),
  );
  //------ Theme -----------------
  serviceLocator.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
        localDataSource: serviceLocator<ThemeLocalDataSource>()),
  );

  //--------------------------------- USE CASES --------------------------------

  //------- stream auth -----------------
  serviceLocator.registerLazySingleton(
    () => StreamAuthUserUseCase(
      authRepositories: serviceLocator<AuthRepository>(),
    ),
  );

  //------- sign up ------------
  serviceLocator.registerLazySingleton(
     () => SignUpUseCase(
       authRepository: serviceLocator<AuthRepository>(),
     ),
  );
  //------- Sign In --------------
  serviceLocator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(authRepository: serviceLocator<AuthRepository>()));

  //------- Sign Out --------------
  serviceLocator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(authRepository: serviceLocator<AuthRepository>())
  );
  //------- Theme ----------------
  serviceLocator.registerLazySingleton<StreamThemeUseCase>(
    () =>
        StreamThemeUseCase(themeRepository: serviceLocator<ThemeRepository>()),
  );
  serviceLocator
      .registerLazySingleton<SwitchThemeUseCase>(() => SwitchThemeUseCase(
            themeRepository: serviceLocator<ThemeRepository>(),
          ));

  //------------------------------- BLOC/CUBIT ---------------------------------
  //------------ sign in cubit ----------------------------
  serviceLocator.registerFactory<SignInCubit>(
      () => SignInCubit(signInUseCase: serviceLocator<SignInUseCase>()));

  //------------ sign up cubit -----------------------------
  serviceLocator.registerFactory<SignUpCubit>(
    () => SignUpCubit(signUpUseCase: serviceLocator<SignUpUseCase>())
  );
}
