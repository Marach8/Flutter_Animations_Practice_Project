import 'package:animations/examples/example4/person_class.dart';
import 'package:animations/examples/example4/person_details_view.dart';
import 'package:flutter/material.dart';

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People').changeText(Colors.white70, 20),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: ListView(
        children: people.map((person) => ListTile(
          title: Text(person.name).changeText(Colors.white, 20),
          subtitle: Text('${person.age.toString()} years old').changeText(Colors.white70, 15),
          leading: Hero(
            transitionOnUserGestures: true,
            flightShuttleBuilder: (
              (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                switch(flightDirection){
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent, 
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0, end: 2.0)
                            .chain(CurveTween(curve: Curves.easeInCirc))
                        ),
                        child: toHeroContext.widget
                      )
                    );
                  case HeroFlightDirection.pop:
                    return Material(color: Colors.transparent, child: fromHeroContext.widget);
                }
              }
            ),
            tag: person.name, child: Text(person.emoji,).changeText(Colors.white, 30)
          ), 
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => PersonDetailsView(person: person))
          ),       
        )
        ).toList()
      )
    );
  }
}



extension ChangeText on Text{
  Text changeText(Color color, double size) 
    => Text(data ?? '', style: TextStyle(color: color, fontSize: size));
}