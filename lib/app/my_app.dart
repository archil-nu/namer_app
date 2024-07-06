import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

import 'package:namer_app/screens/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = List<WordPair>.empty(growable: true);

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite(var pair) {
    var pairToToggle = pair ?? current;

    if (favorites.contains(pairToToggle)) {
      favorites.remove(pairToToggle);
    } else {
      favorites.add(pairToToggle);
    }
    notifyListeners();
  }
}
