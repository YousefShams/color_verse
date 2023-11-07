import 'package:flutter/material.dart';
import '../resources/app_values.dart';

class DefaultAnimationWidget extends StatelessWidget {
  final Widget child;
  final double offsetStartY;
  final double offsetStartX;
  final int opacityMs;
  final int translationMs;

  const DefaultAnimationWidget({Key? key, required this.child,
    this.offsetStartY = 0, this.offsetStartX = 0,
    this.opacityMs = AppValues.fastAnimationTime,
    this.translationMs = AppValues.defaultAnimationTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: translationMs),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, _) => AnimatedOpacity(
        duration: Duration(milliseconds: opacityMs),
        opacity: value.ceilToDouble(),
        child: Transform.translate(
          offset: Offset(-offsetStartX + (value*offsetStartX),
              -offsetStartY + (value*offsetStartY)),
          child: child,
        ),
      ),
    );
  }
}
