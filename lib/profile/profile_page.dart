import 'package:flutter/material.dart';
import '../widgets/top_bar.dart'; // Import the custom top bar widget
import '../widgets/drawer.dart'; // Import the custom drawer widget
import '../styles/styles.dart'; // Import the styles

class MyProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color iconColor;

  MyProfilePage({
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBar(
        title: 'My Profile',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onNotificationsPressed: () {
          // Add notification action here
        },
      ),
      drawer: AppDrawer(iconColor: iconColor),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor1,
              backgroundColor2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture and Full Name
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/CROPIMAG_PROFILE.JPG'), // Ensure this path matches your asset
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Full Name', // Replace with dynamic user name
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              // Buttons for different sections
              Expanded(
                child: ListView(
                  children: [
                    _buildSectionButton('Basic Information'),
                    _buildSectionButton('Government Information'),
                    _buildSectionButton('Work Information'),
                    _buildSectionButton('Work Schedule'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionButton(String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Add navigation or action logic here
        },
      ),
    );
  }
}
