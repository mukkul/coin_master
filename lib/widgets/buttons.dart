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
    this.elevation = 4,
  });

  const Buttons.secondary({
    super.key,
    this.child,
    required this.onPressed,
    this.buttonColor = Colors.grey,
    this.elevation = 0,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: buttonColor,
      onPressed: onPressed,
      elevation: elevation,
      child: child,
    );
  }
}
