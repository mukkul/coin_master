import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.black,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showErrorSnackBar({required String error}) {
    showSnackBar(
      message: error,
      backgroundColor: Colors.red,
    );
  }
}
