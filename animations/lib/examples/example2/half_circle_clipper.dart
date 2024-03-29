import 'package:animations/examples/example2/enum_extension.dart';
import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path>{
  final CircleSide side;

  const HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}