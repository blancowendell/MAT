import 'package:flutter/material.dart';
import '../styles/styles.dart'; // Ensure correct import path

class AppDrawer extends StatelessWidget {
  final Color iconColor;

  AppDrawer({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/CROPIMAG_PROFILE.JPG'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: iconColor),
            title: Text('Home', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: iconColor),
            title: Text('My Profile', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/profile_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on, color: iconColor),
            title: Text('Salary', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/salary');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: iconColor),
            title: Text('Leaves', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/leaves');
            },
          ),
          ListTile(
            leading: Icon(Icons.request_page, color: iconColor),
            title: Text('Requests', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/requests');
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: iconColor),
            title: Text('Attendance', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/attendance');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: iconColor),
            title: Text('Settings', style: AppStyles.drawerTextStyle),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
