import 'package:easy_localization/easy_localization.dart';

class LocalizationUtil {
  LocalizationUtil._();
  static String getTranslatedString(String key) {
    return key.tr();
  }
}
