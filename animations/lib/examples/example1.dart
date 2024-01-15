import 'dart:math';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> with TickerProviderStateMixin{
  late AnimationController controller, sliderController;
  late Animation<double> animation;
  late Animation<Offset> sliderAnimation;

  @override 
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    )..repeat();

    sliderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    )..repeat();

    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller);

    sliderAnimation = Tween<Offset>(
      begin: const Offset(0, 0), end: const Offset(2, 0)
    ).animate(sliderController);

    sliderAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        sliderController..reset()..forward();
      }
    });
  }


  @override 
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: SlideTransition(
          position: sliderAnimation,
          child: const Text('How are you doing today'),
        ),
        //centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) => Transform(
            //The alignment property indicates the point through which the axis of rotation passes through
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(animation.value),
            child: Container(
              width: 100, 
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue, 
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.yellow,
                    spreadRadius: 10,
                    blurRadius: 10,
                    //offset: Offset(10, 10)
                  )
                ]
              )
            ),
          ),
        ),
      )
    );
  }
}