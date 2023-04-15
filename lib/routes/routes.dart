import 'package:coin_master/views/login_view.dart';
import 'package:coin_master/views/profile_view.dart';
import 'package:coin_master/views/splash_view.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> appRoutes = {
    '/': (_) => const SplashView(),
    '/login': (_) => const LoginView(),
    '/profile': (_) => const ProfileView(),
  };
}
