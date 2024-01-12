import 'package:animations/examples/example6/custom_clipper.dart';
import 'package:flutter/material.dart';

class Example6 extends StatefulWidget {
  const Example6({super.key});

  @override
  State<Example6> createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  var randomColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: ColorTween(
              begin: getRandomColor(),
              end: randomColor
            ),
            builder: (_, color, ___) => ColorFiltered(
              colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width
              ),
            ),
            onEnd: () => setState(() => randomColor = getRandomColor())
          )
        ),
      )
    );
  }
}