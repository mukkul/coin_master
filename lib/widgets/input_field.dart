import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.textEditingController,
    this.onTap,
    this.maxLines,
    this.hintText,
  });

  InputField.digitOnly({
    super.key,
    required this.textEditingController,
    this.onTap,
    this.maxLines,
    this.hintText,
  }) {
    keyboardType = TextInputType.phone;
   inputDecoration = InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      hintText: hintText,
    );
  }

  InputField.withBorder({
    super.key,
    required this.textEditingController,
    this.onTap,
    this.maxLines,
    this.hintText,
  }) {
    inputDecoration = InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      hintText: hintText,
    );
  }

  final TextEditingController textEditingController;
  static TextInputType keyboardType = TextInputType.none;
  static InputDecoration? inputDecoration;
  final VoidCallback? onTap;
  final int? maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: inputDecoration,
      onTap: onTap,
      maxLines: maxLines,
    );
  }
}
