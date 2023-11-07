import 'package:color_verse/app/resources/app_values.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityTransition extends StatelessWidget {
  final Widget page;
  final int duration;
  const AnimatedOpacityTransition(this.page, {Key? key,
    this.duration = AppValues.pageAnimationTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: duration),
        builder: (context, double tweenVal, widget) {
          return AnimatedOpacity(
            opacity: tweenVal.toDouble(),
            duration: Duration(milliseconds: duration),
            child: widget,
          );
        },
        child: page,
    );
  }
}
