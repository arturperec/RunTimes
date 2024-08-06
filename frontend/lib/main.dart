import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/password_reset_screen.dart';
import 'screens/entry_screen.dart';
import 'screens/main_screen.dart';
import 'screens/polar_login_screen.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
    print('Environment variables loaded: ${dotenv.env}');
  } catch (e) {
    print('Failed to load .env file: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Times',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/entry',
      routes: {
        '/entry': (context) => const EntryScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/password_reset': (context) => const PasswordResetScreen(),
        '/main': (context) => MainScreen(username: ModalRoute.of(context)!.settings.arguments as String),
        '/polar_login': (context) => PolarLoginScreen(),
      },
    );
  }
}
