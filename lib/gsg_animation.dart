import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class GsgAnimation extends StatefulWidget {
  @override
  _GsgAnimationState createState() => _GsgAnimationState();
}

class _GsgAnimationState extends State<GsgAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});

        //to show the animation status
      })
      ..addStatusListener((status) {
        //completed: finished
        //dismiss: return to 0
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Center(
          child: Container(
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
