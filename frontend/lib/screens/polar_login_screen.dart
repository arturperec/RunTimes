import 'package:flutter/material.dart';
import '../services/polar_auth_service.dart';

class PolarLoginScreen extends StatelessWidget {
  final PolarAuthService _polarAuthService = PolarAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login with Polar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _polarAuthService.authenticate();
          },
          child: Text('Login with Polar'),
        ),
      ),
    );
  }
}
