import 'package:flutter/material.dart';
import 'dart:math';

class CircleClipper extends CustomClipper<Path>{
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();

    //We are creating a rectangle from a circle
    final rect = Rect.fromCircle(
      center: Offset(size.width/2, size.height/2), 
      radius: size.width/2
    );

    //We are adding the rectangle to the path so an oval or ellipse shape with the
    //foci of the width and height of the rectangle can be created
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}


//This function generates a random color
Color getRandomColor() => Color(0xFF000000 + Random().nextInt(0x00FFFFFF));