import 'dart:math';

import 'package:flutter/material.dart';

class Polygon extends CustomPainter{
  final int sides;

  Polygon({super.repaint, required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 1;

    final path = Path();

    final radius = size.width/2;
    final center = Offset(radius, radius);
    final angle = (2 * pi)/sides;
    final angles = List.generate(sides, (index) => index * angle);

    path.moveTo(center.dx + radius * cos(0), center.dy + radius * sin(0));

    for (final angle in angles){
      path.lineTo(center.dx + radius * cos(angle), center.dx + radius * sin(angle));
    }

    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) 
    => oldDelegate is Polygon && oldDelegate.sides != sides;

}