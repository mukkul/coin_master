import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
    );
  }
}
