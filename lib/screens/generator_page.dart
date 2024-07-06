import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:namer_app/app/my_app.dart';
import 'package:namer_app/components/big_card.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () => appState.toggleFavorite(null),
                  icon: Icon(icon),
                  label: Text('Like')),
              SizedBox(width: 10.0),
              ElevatedButton(
                  onPressed: () => appState.getNext(), child: Text('Next')),
            ],
          ),
        ],
      ),
    );
  }
}
