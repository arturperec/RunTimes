import 'package:flutter/material.dart';
import '../services/polar_auth_service.dart';

class PolarLoginScreen extends StatelessWidget {
  final PolarAuthService _polarAuthService = PolarAuthService();

  PolarLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with Polar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await _polarAuthService.authenticate();
            } catch (e) {
              print('Error: $e');
            }
          },
          child: const Text('Login with Polar'),
        ),
      ),
    );
  }
}
