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