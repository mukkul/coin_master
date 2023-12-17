import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    this.child,
    required this.onPressed,
    this.buttonColor,
    this.elevation,
  });

  const Buttons.primary({
    super.key,
    this.child,
    required this.onPressed,
    this.buttonColor,
    this.elevation,
  });

  const Buttons.secondary({
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
      elevation: elevation,
      child: child,
    );
  }
}
