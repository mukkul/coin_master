import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? labelText;
  final Widget? preffixIcon;
  final String? errorText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool obscureText;
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      this.suffixIcon,
      this.errorText,
      this.labelText,
      this.preffixIcon,
      this.keyboardType,
      this.onChanged,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        key: const Key('signIn_emailInput_textField'),
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
          labelText: labelText,
          errorText: errorText,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        obscureText: obscureText,
      ),
    );
  }
}
