import 'package:coin_master/utils/keys/app_global_keys.dart';
import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:flutter/material.dart';

class CommonUIElements {
  static final SnackBar _networkSnackBar = SnackBar(
    content: Text(
      LocalizationUtil.getTranslatedString('offlineSnackBarText'),
    ),
  );


  static void showNetworkSnackBar() {
    AppGlobalKeys.scaffoldKey.currentState?.showSnackBar(_networkSnackBar);
  }
  static showErrorSnackBar({required String error}) {
   AppGlobalKeys.scaffoldKey.currentState?.showSnackBar(SnackBar(
    content: Text(
      error,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.red,
    ));
  }
}
