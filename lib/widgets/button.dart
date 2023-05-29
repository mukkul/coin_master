import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, this.child, required this.onPressed, this.buttonColor, this.elevation});

  const Button.primary(
      {super.key, this.child, required this.onPressed, this.buttonColor, this.elevation});

  const Button.secondary({
    super.key,
    this.child,
    required this.onPressed,
    this.buttonColor,
    this.elevation,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow.shade600,
      onPressed: onPressed,
      elevation: 4,
      child: child,
    );
  }
}
