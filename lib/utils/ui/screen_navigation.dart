import 'package:coin_master/database/shared_preference_key.dart';
import 'package:coin_master/database/shared_preference_manager.dart';
import 'package:coin_master/screens/login_screens/login_screen.dart';
import 'package:flutter/material.dart';

class ScreenNavigation {
  static Widget getUpcomingScreen() {
    bool isUserLoggedIn = SharedPreferenceManager()
        .getBoolFromPref(SharedPreferenceKey.isUserLoggedIn);
    if (isUserLoggedIn) {
      return Container();
    } else {
      return const LoginScreen();
    }
  }
}
