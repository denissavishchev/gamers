import 'package:flutter/material.dart';
import 'package:gamers/main_page.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
              const MainPage())),
          child: Text('back'),

        ),
      ),
    );
  }
}
