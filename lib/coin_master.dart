import 'package:coin_master/utils/keys/app_global_keys.dart';
import 'package:coin_master/utils/network/network_manager.dart';
import 'package:coin_master/utils/ui/screen_navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CoinMaster extends StatelessWidget {
  const CoinMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppGlobalKeys.scaffoldKey,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: ScreenNavigation.getUpcomingScreen(),
    );
  }
}
