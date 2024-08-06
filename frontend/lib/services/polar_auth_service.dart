import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PolarAuthService {
  final OAuth2Client client;
  final Logger _logger = Logger('PolarAuthService');

  PolarAuthService()
      : client = OAuth2Client(
    authorizeUrl: 'https://flow.polar.com/oauth2/authorization',
    tokenUrl: 'https://flow.polar.com/oauth2/token',
    redirectUri: dotenv.env['POLAR_REDIRECT_URI'] ?? '',
    customUriScheme: 'com.example.runtimes',
  );

  Future<OAuth2Helper> authenticate() async {
    _logger.info('Starting authentication');
    String clientId = dotenv.env['POLAR_CLIENT_ID'] ?? '';
    String clientSecret = dotenv.env['POLAR_CLIENT_SECRET'] ?? '';

    if (clientId.isEmpty || clientSecret.isEmpty) {
      _logger.severe('Polar API client ID or secret not configured');
      throw 'Polar API client ID or secret not configured';
    }

    final helper = OAuth2Helper(
      client,
      clientId: clientId,
      clientSecret: clientSecret,
      scopes: ['read'],
    );

    try {
      var token = await helper.getToken();
      if (token != null && token.accessToken != null) {
        _logger.info('Authentication successful, token: ${token.accessToken}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', token.accessToken!);
      } else {
        _logger.severe('No access token received');
        throw 'No access token received';
      }
    } catch (e) {
      _logger.severe('Authentication failed: $e');
      rethrow;
    }

    return helper;
  }

  Future<void> fetchData() async {
    _logger.info('Fetching data from Polar Flow');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken == null) {
      _logger.severe('No access token found');
      throw 'No access token found';
    }

    final response = await http.get(
      Uri.parse('https://www.polaraccesslink.com/v3/exercises'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _logger.info('Data fetched successfully');
      // Process and store data
    } else {
      _logger.severe('Failed to fetch data: ${response.statusCode} ${response.body}');
      throw 'Failed to fetch data';
    }
  }
}