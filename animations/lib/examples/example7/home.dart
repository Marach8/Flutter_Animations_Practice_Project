import 'dart:math';

import 'package:animations/examples/example7/polygon.dart';
import 'package:flutter/material.dart';

class Example7 extends StatefulWidget {
  const Example7({super.key});

  @override
  State<Example7> createState() => _Example7State();
}

class _Example7State extends State<Example7> with TickerProviderStateMixin{
  late AnimationController sidesController, radiusController, rotationController;
  late Animation<int> sidesAnimation, radiusAnimation, rotationAnimation;

  @override 
  void initState() {
    super.initState();
    sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )..repeat(reverse: true);

    radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )..repeat(reverse: true);

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )..repeat(reverse: true);

    sidesAnimation = IntTween(begin: 3, end: 10).animate(sidesController);
    //you can use only a Tween if your radiusAnimation was declared to be a double
    //for the CurvedAnimation, you can use a .chain(CurvedTween()) before .animate()
    radiusAnimation = IntTween(begin: 50, end: 400).chain(
      CurveTween(curve: Curves.bounceOut)
    )
    .animate(radiusController);

    rotationAnimation = IntTween(begin: 0, end: 2 * pi.toInt()).chain(
      CurveTween(curve: Curves.easeInOut)
    ).animate(rotationController);
  }

  // @override 
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   controller.repeat(reverse: true);
  // }

  @override 
  void dispose(){
    sidesController.dispose();
    radiusController.dispose();
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            sidesController, radiusController, rotationController
          ]),
          builder: (_, __) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(rotationAnimation.value.toDouble())
              ..rotateY(rotationAnimation.value.toDouble())
              ..rotateZ(rotationAnimation.value.toDouble()),
            child: CustomPaint(
              painter: Polygon(sides: sidesAnimation.value),
              child: SizedBox(
                width: radiusAnimation.value.toDouble(),
                height: radiusAnimation.value.toDouble()
              )
            ),
          ),
        ),
      )
    );
  }
}
