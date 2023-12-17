import 'package:coin_master/features/login/bloc/auth_bloc.dart';
import 'package:coin_master/features/login/domain/repository/auth_repository.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:coin_master/features/theme/domain/repositories/theme_repository.dart';
import 'package:coin_master/features/theme/domain/usecases/switch_theme_usecase.dart';
import 'package:coin_master/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:coin_master/shared/navigation/app_router.dart';
import 'package:coin_master/utils/keys/app_global_keys.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinMaster extends StatelessWidget {
 
  const CoinMaster({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: serviceLocator<AuthRepository>()),
        RepositoryProvider.value(value: serviceLocator<ThemeRepository>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(
                switchThemeUseCase: serviceLocator<SwitchThemeUseCase>()),
          ),
          BlocProvider<SignInCubit>(
            create: (context) => serviceLocator<SignInCubit>(),
          )
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: AppGlobalKeys.scaffoldKey,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              theme: ThemeData(
                fontFamily: 'Montserrat',
                primarySwatch: Colors.blue,
              ),
              routerConfig: AppRouter(context.read<AuthBloc>()).router,
            );
          },
        ),
      ),
    );
  }
}
