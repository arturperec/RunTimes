import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clientIdController = TextEditingController();
  final TextEditingController _clientSecretController = TextEditingController();
  final TextEditingController _redirectUriController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _clientIdController.text = prefs.getString('polarClientId') ?? '';
      _clientSecretController.text = prefs.getString('polarClientSecret') ?? '';
      _redirectUriController.text = prefs.getString('polarRedirectUri') ?? '';
    });
  }

  _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('polarClientId', _clientIdController.text);
    prefs.setString('polarClientSecret', _clientSecretController.text);
    prefs.setString('polarRedirectUri', _redirectUriController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings saved')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _clientIdController,
                decoration: const InputDecoration(labelText: 'Polar Client ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the client ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _clientSecretController,
                decoration: const InputDecoration(labelText: 'Polar Client Secret'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the client secret';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _redirectUriController,
                decoration: const InputDecoration(labelText: 'Polar Redirect URI'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the redirect URI';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveSettings();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
