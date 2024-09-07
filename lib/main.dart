import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        primarySwatch: Colors.purple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class Dog {
  const Dog(
      {required this.name,
      required this.description,
      required this.age,
      required this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Dog> _Dog = <Dog>[
  const Dog(
      name: 'Chimi',
      description: 'something to say here and amizing dog is for you',
      age: 12,
      imageUrl: 'image_server/dogs-improve.jpg'),
  const Dog(
      name: 'Badog',
      description: 'something to say here and amizing dog is for you',
      age: 8,
      imageUrl: 'image_server/essay-final.jpg'),
  const Dog(
      name: 'Omios',
      description: 'something to say here and amizing dog is for you',
      age: 7,
      imageUrl: 'image_server/maltese-portrait.jpg'),
  const Dog(
      name: 'Danes',
      description: 'something to say here and amizing dog is for you',
      age: 6,
      imageUrl: 'image_server/golden-retriever-puppy.jpg'),
  const Dog(
      name: 'Satira',
      description: 'something to say here and amizing dog is for you',
      age: 5,
      imageUrl: 'image_server/science-life-extension-drug.jpg'),
  const Dog(
      name: 'Luna',
      description: 'something to say here and amizing dog is for you',
      age: 2,
      imageUrl: 'image_server/small-dog-breeds.jpg'),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _dialogBuilder(BuildContext context, Dog dog) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.asset(
          dog.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                dog.name,
                style: localTheme.textTheme.displayMedium,
              ),
              Text(
                '${dog.age} months old',
                style: localTheme.textTheme.titleLarge,
              ),
              const SizedBox(height: 10.0),
              Text(
                dog.description,
                style: localTheme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('I\'M ALLERGIC'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('ADOPT'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _Dog[index]),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _Dog[index].name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Dogs'),
      ),
      body: ListView.builder(
        itemCount: _Dog.length,
        itemExtent: 60,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
