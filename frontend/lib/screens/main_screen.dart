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
            icon: Icon(Icons.menu),
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
            DrawerHeader(
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
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _logout(context);
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
