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
  // AnimationController animationController2;

  Animation animation;
  // Animation animation2;
  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   duration: Duration(seconds: 3),
    //   vsync: this,
    // );
    // // final curvedAnimation = CurvedAnimation(
    // //   parent: animationController,
    // //   curve: Curves.easeIn,
    // //   reverseCurve: Curves.easeInCirc,
    // // );
    // animation = Tween<double>(
    //   begin: 0,
    //   end: 2 * math.pi,
    // ).chain(CurveTween(curve: Curves.bounceInOut)).animate(animationController)
    //   ..addListener(() {
    //     setState(() {});

    //     //to show the animation status
    //   })
    //   ..addStatusListener((status) {
    //     //completed: finished
    //     //dismiss: return to 0
    //     if (status == AnimationStatus.completed) {
    //       animationController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       animationController.forward();
    //     }
    //   });
    // animationController.forward();

    /////for Transiton//////
    animationController = AnimationController(
      duration: Duration(seconds: 99),
      vsync: this,
    )..repeat(reverse: true);
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -1),
    ).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Transform.rotate(
      //   angle: animation.value,
      //   child: Center(
      //     child: Container(
      //       child: FlutterLogo(),
      //     ),
      //   ),
      // ),
      // body: Transform.scale(
      //   scale: animation.value,
      //   child: Center(
      //     child: Container(
      //       child: FlutterLogo(),
      //     ),
      //   ),
      // ),
      // body: Transform.translate(
      //   offset: Offset(0, -100), // take just one point so the setState don't updated
      //   child: Center(
      //     child: Container(
      //       child: FlutterLogo(),
      //     ),
      //   ),
      // ),
      body: SlideTransition(
        position: animation,
        child: Center(
          child: Container(
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    // animationController2.dispose();
    super.dispose();
  }
}
