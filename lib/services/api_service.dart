import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:3000';  // For emulator
  // static const String _baseUrl = 'http://192.168.1.10:3000';  // Replace with your machine's local IP for physical device

  static Future<bool> login(String login, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': login,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Login failed with status: ${response.statusCode}, body: ${response.body}');
      return false;
    }
  }

  static Future<bool> guestLogin() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/guest_login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Guest login failed with status: ${response.statusCode}, body: ${response.body}');
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
      print('Registration failed with status: ${response.statusCode}, body: ${response.body}');
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
      print('Password reset failed with status: ${response.statusCode}, body: ${response.body}');
      return false;
    }
  }
}
