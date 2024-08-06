import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username;

  const MainScreen({Key? key, required this.username}) : super(key: key);

  void _logout(BuildContext context) {
    // Clear the session or any relevant data
    Navigator.pushReplacementNamed(context, '/entry');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${username == 'guest' ? 'Guest' : username}!'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _logout(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Polar Login'),
              onTap: () {
                Navigator.pushNamed(context, '/polar_login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome, ${username == 'guest' ? 'Guest' : username}!'),
      ),
    );
  }
}
