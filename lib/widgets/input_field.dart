import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.textEditingController});
  
  InputField.digitOnly({
    super.key,
    required this.textEditingController,
  }) {
    keyboardType = TextInputType.phone;
  }

  final TextEditingController textEditingController;
  static TextInputType keyboardType = TextInputType.none;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: keyboardType,
    );
  }
}
