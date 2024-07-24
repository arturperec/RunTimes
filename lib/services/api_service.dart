// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://127.0.0.1:3000';

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Save token and navigate to home screen
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user': {
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': password,
        }
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/password/forgot'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
