import 'package:flutter/material.dart';
import 'package:run_times/services/polar_auth_service.dart';

class PolarLoginScreen extends StatelessWidget {
  final PolarAuthService _polarAuthService = PolarAuthService();

  PolarLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await _polarAuthService.authenticate();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Authentication successful')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Authentication failed: $e')),
              );
            }
          },
          child: const Text('Login with Polar'),
        ),
      ),
    );
  }
}
