import 'package:flutter/material.dart';

class CircularActionButton extends StatelessWidget {
  const CircularActionButton({
    super.key,
    required this.onTap,
    this.color,
    this.margin,
    required this.hSize,
    required this.wSize,
    required this.child,
  });

  final void Function()? onTap;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final double hSize;
  final double wSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hSize,
        width: wSize,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
