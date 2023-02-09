import 'package:flutter/material.dart';
import 'package:gamers/models/games_model.dart';
import 'package:gamers/models/images_model.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => const Games(name: '', avatar: '', poster: '', connected: '', playing: '', friends: '')),
        Provider(create: (context) => const Images(name: '', image: '', name2: '', rating: '', reviews: '', stars: '', description: '', color: '', color2: '')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
