import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('People'), backgroundColor: Colors.black12,),
      body: ListView(
        children: people.map((person) => ListTile(
          title: Text(person.name).changeText(Colors.white, 20),
          subtitle: Text('${person.age.toString()} years old').changeText(Colors.white70, 15),
          leading: Text(person.emoji,).changeText(Colors.white, 30), 
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => PersonDetails(person: person))
          ),       
        )
        ).toList()
      )
    );
  }
}



class PersonDetails extends StatelessWidget {
  final Person person;

  const PersonDetails({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(person.emoji), centerTitle: true, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(10),
            Text(person.name).changeText(Colors.white, 20),
            const Gap(10),
            Text('${person.age.toString()} years old').changeText(Colors.white60, 20)
          ],
        ),
      )
    );
  }
}



class Person{
  final String name, emoji;
  final int age;

  Person({required this.name, required this.age, required this.emoji});
}

List<Person> people = [
  Person(name: 'Emmanuel', age: 20, emoji: '👲'),
  Person(name: 'Nnanna', age: 25, emoji: '😂'),
  Person(name: 'Marach', age: 50, emoji: '🧑🏽‍🤝‍🧑🏽')
];


extension on Text{
  Text changeText(Color color, double size) 
    => Text(data ?? '', style: TextStyle(color: color, fontSize: size));
}