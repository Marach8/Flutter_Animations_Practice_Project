import 'package:flutter/material.dart';

enum CircleSide{left, right}

extension ToPath on CircleSide{
  Path toPath(Size size){
    final Offset offset;
    final Path path = Path();
    final bool clockwise;

    //Note: Each container in the row has its own axis starting from its topleft
    switch(this){
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    //The offset is majorly indicating the end of the arc
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width/2, size.height/2),
      clockwise: clockwise
    );
    path.close();
    return path;
  }
}


extension DelayCallback on VoidCallback{
  Future delayed(int seconds) => Future.delayed(Duration(seconds: seconds), this);
}