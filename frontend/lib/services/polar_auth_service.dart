import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../utils/api_constants.dart';

class PolarAuthService {
  Future<void> authenticate() async {
    final Uri authUrl = Uri.parse('http://localhost:3000/polar/auth');
    if (await canLaunchUrl(authUrl)) {
      await launchUrl(authUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $authUrl';
    }
  }


  Future<void> handleCallback(String code) async {
    final Uri callbackUrl = Uri.parse('${ApiConstants.polarCallbackUrl}?code=$code');
    final response = await http.get(callbackUrl);
    if (response.statusCode != 200) {
      throw Exception('Failed to authenticate with Polar');
    }
  }
}
