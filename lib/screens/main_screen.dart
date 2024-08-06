import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username;

  const MainScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${username == 'guest' ? 'Guest' : username}!'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/entry');
          },
        ),
      ),
      body: Center(
        child: Text('Welcome, ${username == 'guest' ? 'Guest' : username}!'),
      ),
    );
  }
}
