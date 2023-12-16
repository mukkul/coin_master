import 'package:coin_master/coin_master.dart';
import 'package:coin_master/database/shared_preference_manager.dart';
import 'package:coin_master/features/login/bloc/auth_bloc.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/features/login/domain/usecases/sign_out_usecase.dart';
import 'package:coin_master/features/login/domain/usecases/stream_auth_user_usecase.dart';
import 'package:coin_master/features/theme/bloc/theme_bloc.dart';
import 'package:coin_master/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:coin_master/features/theme/domain/entities/custom_theme.dart';
import 'package:coin_master/features/theme/domain/usecases/stream_theme_usecase.dart';
import 'package:coin_master/flavor_config.dart';
import 'package:coin_master/utils/constants.dart';
import 'package:coin_master/utils/firebase/firebase_config.dart';
import 'package:coin_master/utils/network/network_manager.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_master/utils/service_locator.dart' as service;

late FlavorConfig flavorConfig;

Future<void> mainCommon(FlavorConfig config) async {
  flavorConfig = config;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FirebaseConfig.initializeFlutterFire();
  NetworkManager.initNetworkMonitor();
  await SharedPreferenceManager.initSharedPreferences();
  await service.init();
  final user = await serviceLocator<AuthRepository>().authUserStream.first;
  final initialTheme =
      await ThemeRepositoryImpl(localDataSource: serviceLocator())
          .getTheme()
          .first;
  runApp(
    EasyLocalization(
      supportedLocales: Constants.supportedLocale,
      path: Constants.stringTranslationsPath,
      fallbackLocale: Constants.localEnglish,
      assetLoader: JsonAssetLoader(),
      useOnlyLangCode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              streamAuthUserUseCase: serviceLocator<StreamAuthUserUseCase>(),
              signOutUseCase: serviceLocator<SignOutUseCase>(),
              authUser: user,
            )..add(AppUserChanged(user)),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(
              streamThemeUseCase: serviceLocator<StreamThemeUseCase>(),
              initialTheme: initialTheme == CustomTheme.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
            )..add(ThemeChanged(initialTheme)),
          ),
        ],
        child: const CoinMaster(),
      ),
    ),
  );
}
