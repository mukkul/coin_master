import 'package:flutter/material.dart';

class LoginController {
  static final List<String> validInitialDigitsForPhone = ['6', '7', '8', '9'];

  static bool isValidPhoneNumber = false;

  static late final TextEditingController phoneController;

  static void addListenerPhoneInput() {
    phoneController.addListener(() {
      isValidPhoneNumber =
          validatePhoneNumber(phoneNumber: phoneController.text.trim());
    });
  }

  static bool validatePhoneNumber({required String phoneNumber}) {
    if (phoneNumber.length == 10 &&
        validInitialDigitsForPhone.contains(phoneNumber.characters.first)) {
      return true;
    } else {
      return false;
    }
  }
}
