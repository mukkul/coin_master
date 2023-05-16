import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.child,
    required this.onPressed,
  });

  final Widget? child;
  final VoidCallback? onPressed;

  const Button.primary({
    super.key,
    this.child,
    required this.onPressed,
  });

    const Button.secondary({
    super.key,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
