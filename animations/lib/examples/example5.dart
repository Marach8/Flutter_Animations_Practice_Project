import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Example5 extends StatefulWidget {
  const Example5({super.key});

  @override
  State<Example5> createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: isZoomed ? Curves.easeOut : Curves.easeIn,
          width: isZoomed ? MediaQuery.of(context).size.width : 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/FB_IMG_1691828515571.png', fit: BoxFit.cover),
              const Gap(10),
              TextButton(
                onPressed: () => setState(() => isZoomed = !isZoomed),
                child: Text(isZoomed ? 'Zoom In' : 'Zoom Out')
              )
            ],
          ),
        ),
      )
    );
  }
}