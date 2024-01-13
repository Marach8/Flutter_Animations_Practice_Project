import 'package:animations/examples/example8/drawer_and_mainscreen.dart';
import 'package:flutter/material.dart';

class Example8 extends StatelessWidget {
  const Example8({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerAndScreen(
      drawer: Material(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.blueGrey.shade100,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 70, top: 100),
            itemCount: 20,
            itemBuilder: (_, index) => ListTile(
              title: Text('item $index')
            )
          )
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Child'), centerTitle: true, foregroundColor: Colors.white60,
        ),
        body: Container(
          color: Colors.blueGrey.shade900
        )
      )
    );
  }
}