import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "You're signed in!",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}