import 'package:flutter/material.dart';

class WelcomHome extends StatelessWidget {
  const WelcomHome({super.key});

  @override
  Widget build(BuildContext context) {   // A random blank PAge to go to when clicked on something, can be updated later for specific task
    return Scaffold(
        appBar: AppBar(
          title: Text('WelcomeScreen'),
        ),
    );
  }
}
