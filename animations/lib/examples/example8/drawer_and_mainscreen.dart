import 'dart:math' show pi;
import 'package:flutter/material.dart';

class DrawerAndScreen extends StatefulWidget {
  final Widget child, drawer;
  const DrawerAndScreen({required this.drawer, required this.child, super.key});

  @override
  State<DrawerAndScreen> createState() => _Example8State();
}

class _Example8State extends State<DrawerAndScreen> with TickerProviderStateMixin{
  late AnimationController childController, drawerController;
  late Animation<double> childAnimation, drawerAnimation;

  @override 
  void initState(){
    super.initState();
    childController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    childAnimation = Tween<double>(begin: 0, end: -pi/2).animate(childController);
    drawerAnimation = Tween<double>(begin: pi/2.7, end: 0).animate(drawerController);
  }

  @override 
  void dispose(){
    childController.dispose();
    drawerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxDrag = width * 0.8;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        childController.value += details.delta.dx / maxDrag;
        drawerController.value += details.delta.dx / maxDrag;
      },
      onHorizontalDragEnd: (details){
        if(childController.value < 0.5){
          childController.reverse();
          drawerController.reverse();
        } else {
          childController.forward();
          drawerController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([childController, drawerController]),
        builder: (_, __) => Stack(
          children: [
            Container(color: Colors.black,),
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(childAnimation.value * maxDrag)
                ..rotateY(childAnimation.value),
              child: widget.child
            ),
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(-width + drawerAnimation.value * 0.8)
                ..rotateY(drawerAnimation.value),
              child: widget.drawer
            )
          ],
        ),
      ),
    );
  }
}