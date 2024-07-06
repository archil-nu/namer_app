import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:namer_app/app/my_app.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('You have ${favorites.length} favorites')),
        ...(favorites.map((pair) => ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
              onTap: () {
                appState.toggleFavorite(pair);
              },
            ))).toList()
      ],
    );
  }
}
