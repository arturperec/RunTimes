import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/password_reset_screen.dart';
import 'screens/entry_screen.dart';
import 'screens/main_screen.dart';
import 'screens/polar_login_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/register': (context) => RegistrationScreen(),
        '/password_reset': (context) => PasswordResetScreen(),
        '/main': (context) => MainScreen(username: ModalRoute.of(context)!.settings.arguments as String),
        '/polar_login': (context) => PolarLoginScreen(),
      },
    );
  }
}
