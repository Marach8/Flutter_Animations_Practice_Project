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
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => setState(() => isZoomed = !isZoomed),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: isZoomed ? Curves.easeOut : Curves.easeIn,
                  width: isZoomed ? MediaQuery.of(context).size.width : 100,
                  child: Image.asset('assets/FB_IMG_1691828515571.png', fit: BoxFit.cover),
                      // TextButton(
                      //   onPressed: () => setState(() => isZoomed = !isZoomed),
                      //   child: Text(isZoomed ? 'Zoom In' : 'Zoom Out')
                      // )
                    
                ),
              ),

              GestureDetector(
                onTap: () => setState(() => isZoomed = !isZoomed),
                child: AnimatedContainer(                  
                  duration: const Duration(milliseconds: 500),
                  curve: !isZoomed ? Curves.easeOut : Curves.easeIn,
                  width: !isZoomed ? MediaQuery.of(context).size.width : 100,
                  child: Image.asset('assets/IMG-20230523-WA0191.jpg', fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}