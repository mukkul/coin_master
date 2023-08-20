import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.elevation,
    this.onTap,
  });
  
  final Image? backgroundImage;
  final Color? backgroundColor;
  final Widget child;
  final double? elevation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        elevation: elevation,
        child: child,
      ),
    );
  }
}
