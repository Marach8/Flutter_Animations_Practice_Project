import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vector_math/vector_math_64.dart'  show Vector3;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> with TickerProviderStateMixin{
  late AnimationController controller1, controller2, controller3;
  late Tween<double> animation;

  @override 
  void initState(){
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20)
    );

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    );

    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40)
    );

    animation = Tween<double>(begin: 0, end: pi * 2);
  }


  @override 
  void dispose(){
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller1..reset()..repeat();
    controller2..reset()..repeat();
    controller3..reset()..repeat();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(100),
              AnimatedBuilder(
                animation: Listenable.merge([
                  controller1, controller2, controller3
                ]),
                builder: (_, __) => Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(animation.evaluate(controller1))
                    ..rotateY(animation.evaluate(controller2))
                    ..rotateZ(animation.evaluate(controller3)),
                  child: Stack(
                    children: [
                      //back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..translate(
                          Vector3(0, 0, -100)
                        ),
                        child: Container(color: Colors.blue, height: 100, width: 100)
                      ),
                      //left
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi/2),
                        child: Container(color: Colors.purple, height: 100, width: 100)
                      ),
                      //right
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi/2),
                        child: Container(color: Colors.yellow, height: 100, width: 100)
                      ),
                      //front
                      Container(color: Colors.red, height: 100, width: 100),
                      //top
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi/2),
                        child: Container(color: Colors.green, height: 100, width: 100)
                      ),
                      //bottom
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi/2),
                        child: Container(color: Colors.white, height: 100, width: 100)
                      ),
                    ]
                  ),
                ),
              )
            ]
          ),
        )
      )
    );
  }
}