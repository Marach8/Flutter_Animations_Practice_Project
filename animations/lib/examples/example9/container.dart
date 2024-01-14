import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Example extends StatefulWidget {
  final String title, subtitle;
  final Widget child;
  const Example({required this.title, required this.subtitle, required this.child, super.key});

  @override
  State<Example> createState() => _Example9State();
}

class _Example9State extends State<Example> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> iconScaleAnimation, containerScaleAnimation;
  late Animation<Offset> yDisplacementAnimation;

  @override 
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 1)
    );

    iconScaleAnimation = Tween<double> (
      begin: 7, end: 6
    ).animate(
      CurvedAnimation(
        parent: controller, curve: Curves.easeInOut
      )
    );

    yDisplacementAnimation = Tween<Offset>(
      begin: const Offset(0, 0), end: const Offset(0, -0.25)
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut)
    );

    containerScaleAnimation = Tween<double>(
      begin: 2.0, end: 0.4
    ).animate(
      CurvedAnimation(
        curve: Curves.bounceOut,
        parent: controller
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    controller..reset()..forward();
    
    //ClipRRect ensure the child of the container does not overfow the rounded borders of the container
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: height * 0.5,
          maxWidth: width * 0.8,
        ),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100, 
            minWidth: 100,
            maxHeight: height * 0.8,
            maxWidth: width * 0.8
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 160),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: SlideTransition(
                  position: yDisplacementAnimation,
                  child: ScaleTransition(
                    scale: containerScaleAnimation,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: ScaleTransition(
                        scale: iconScaleAnimation,
                        child: widget.child
                      )
                    )
                  )
                )
              ),
            ],
          )
        )
      ),
    );
  }
}