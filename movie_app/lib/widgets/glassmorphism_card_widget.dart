import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphismCardWidget extends StatelessWidget {
  final double blur;
  final double opacity;
  final double radius;
  final Widget child;

  const GlassmorphismCardWidget({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            // border: Border.all(
            //   width: 1.5,
            //   color: Colors.black.withOpacity(0.2),
            // ),
          ),
          child: child,
        ),
      ),
    );
  }
}
