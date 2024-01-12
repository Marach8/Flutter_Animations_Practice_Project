import 'package:animations/examples/example4/home.dart';
import 'package:animations/examples/example4/person_class.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonDetailsView extends StatelessWidget {
  final Person person;

  const PersonDetailsView({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: person.name, 
          child: Material(
            color: Colors.transparent,
            child: Text(person.emoji).changeText(Colors.white, 50),
          )
        ), 
        centerTitle: true, 
        foregroundColor: Colors.white
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            Text(person.name).changeText(Colors.white, 20),
            const Gap(20),
            Text('${person.age.toString()} years old').changeText(Colors.white60, 20)
          ],
        ),
      )
    );
  }
}