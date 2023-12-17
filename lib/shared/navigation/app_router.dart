import 'dart:async';

import 'package:coin_master/features/presentation/screens/dashboard/home_screen.dart';
import 'package:coin_master/features/login/bloc/auth_bloc.dart';
import 'package:coin_master/features/login/presentation/pages/login_screen.dart';
import 'package:coin_master/features/login/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          name: 'home',
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(
                    opacity: animation,
                    child: child,
                  )),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const LoginScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                        opacity: animation,
                        child: child,
                      )),
        ),
        GoRoute(
          name: 'sign-up',
          path: '/sign-up',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SignUpScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                        opacity: animation,
                        child: child,
                      )),
        ),
      ],
      redirect: (context, state) {
        final bool isAuthenticated =
            authBloc.state.status == AuthStatus.authenticated;
        final bool isSignUp = state.matchedLocation == '/sign-up';
        if (!isAuthenticated) {
          return isSignUp ? '/sign-up':'/login';
        }
        return null;
      },
      refreshListenable: GoRouterRefreshStream(authBloc.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
