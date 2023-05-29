import 'package:coin_master/coin_master.dart';
import 'package:coin_master/database/shared_preference_manager.dart';
import 'package:coin_master/flavor_config.dart';
import 'package:coin_master/utils/constants.dart';
import 'package:coin_master/utils/firebase/firebase_config.dart';
import 'package:coin_master/utils/network/network_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

late FlavorConfig flavorConfig;

Future<void> mainCommon(FlavorConfig config) async {
  flavorConfig = config;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FirebaseConfig.initializeFlutterFire();
  NetworkManager.initNetworkMonitor();
  await SharedPreferenceManager.initSharedPreferences();
  runApp(
    EasyLocalization(
      supportedLocales: Constants.supportedLocale,
      path: Constants.stringTranslationsPath,
      fallbackLocale: Constants.localEnglish,
      assetLoader: JsonAssetLoader(),
      useOnlyLangCode: true,
      child: const CoinMaster(),
    ),
  );
}

