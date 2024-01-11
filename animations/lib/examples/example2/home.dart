import 'dart:math' show pi;
import 'package:animations/examples/example2/enum_extension.dart';
import 'package:animations/examples/example2/half_circle_clipper.dart';
import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> with TickerProviderStateMixin{
  late AnimationController antiClockwiseController, flipAnimationController;
  late Animation<double> antiClockwiseAnimation, flipAnimation;
  
  @override 
  void initState(){
    super.initState();
    antiClockwiseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    flipAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    antiClockwiseAnimation = Tween<double>(begin: 0, end: -pi/2).animate(
      CurvedAnimation(parent: antiClockwiseController, curve: Curves.bounceOut)
    );

    flipAnimation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: flipAnimationController, curve: Curves.bounceOut)
    );

    antiClockwiseController.addStatusListener((status) { 
      if(status == AnimationStatus.completed){
        flipAnimation = Tween<double>(
          begin: flipAnimation.value, end: flipAnimation.value + pi
        ).animate(
          CurvedAnimation(parent: flipAnimationController, curve: Curves.bounceOut)
        );

        flipAnimationController..reset()..forward();
      }
    });


    flipAnimationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        antiClockwiseAnimation = Tween<double>(
          begin: antiClockwiseAnimation.value, end: antiClockwiseAnimation.value - pi/2
        ).animate(
          CurvedAnimation(parent: antiClockwiseController, curve: Curves.bounceOut)
        );

        antiClockwiseController..reset()..forward();
      }
    });
  }

  @override 
  void dispose(){
    antiClockwiseController.dispose();
    flipAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //we are trying to reset the animation controller any time the build function gets called
    //especially by a hot reload
    antiClockwiseController..reset()..forward.delayed(1);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: antiClockwiseController,
          builder: (__, _) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(antiClockwiseAnimation.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,           
              children: [
                AnimatedBuilder(
                  animation: flipAnimationController,
                  builder: (_, __) => Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..rotateY(flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.left),
                      child: Container(
                        color: Colors.blue, 
                        height: 150, width: 150
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: flipAnimationController,
                  builder: (_, __) => Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..rotateY(flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.right),
                      child: Container(
                        color: Colors.yellow, 
                        height: 150, width: 150
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      )
    );
  }
}
