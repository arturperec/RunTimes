import 'package:flutter/material.dart';

class GuestWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Guest'),
      ),
      body: Center(
        child: Text(
          'Welcome, Guest User!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
