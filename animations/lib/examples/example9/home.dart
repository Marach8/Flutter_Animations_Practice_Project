import 'package:animations/examples/example9/container.dart';
import 'package:flutter/material.dart';

class Example9 extends StatelessWidget {
  const Example9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Animation', 
        style: TextStyle(color: Colors.white)), centerTitle: true,
      ),
      body: const Center(
        child: Example(
          title: 'Thank you for your order!',
          subtitle: 'Your order will be delivered in 2 days. Enjoy!',
          child: Icon(Icons.check, color: Colors.white)
        ),
      )
    );
  }
}