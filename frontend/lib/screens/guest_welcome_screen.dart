import 'package:flutter/material.dart';

class GuestWelcomeScreen extends StatelessWidget {
  const GuestWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Guest'),
      ),
      body: const Center(
        child: Text(
          'Welcome, Guest User!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
