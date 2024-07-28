import 'package:flutter/material.dart';
import 'settings_themes.dart'; // Import the settings themes page

class SettingsPage extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color iconColor;

  SettingsPage({
    this.backgroundColor1 = Colors.grey,
    this.backgroundColor2 = Colors.green,
    this.iconColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor1, backgroundColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionButton(context, 'Change Password', Icons.lock, '/change_password'),
              buildSectionButton(context, 'Change Device', Icons.devices, '/change_device'),
              buildSectionButton(context, 'Change Email', Icons.email, '/change_email'),
              buildSectionButton(context, 'Change Themes', Icons.color_lens, '/settings_themes'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionButton(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 32.0, color: iconColor),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
