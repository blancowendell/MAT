import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services package
import 'package:google_fonts/google_fonts.dart';
import 'home/home_page.dart'; // Import the home page
import 'profile/profile_page.dart'; // Import the MyProfilePage
import 'styles/styles.dart'; // Import the styles
import 'settings/settings_page.dart';
import 'settings/settings_themes.dart';
import 'widgets/drawer.dart'; // Import the Drawer
import 'login.dart'; // Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _iconColor = Colors.blue;
  Color _backgroundColor1 = Colors.white;
  Color _backgroundColor2 = Colors.green;

  ThemeData _themeData = ThemeData(
    textTheme: GoogleFonts.kanitTextTheme(),
  );

  void _updateTheme(Color backgroundColor1, Color backgroundColor2, Color iconColor) {
    setState(() {
      _backgroundColor1 = backgroundColor1;
      _backgroundColor2 = backgroundColor2;
      _iconColor = iconColor;
      _themeData = ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
        scaffoldBackgroundColor: backgroundColor1,
      );
      AppStyles.updateGlobalGradient(backgroundColor1, backgroundColor2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => HomePage(
          backgroundColor1: _backgroundColor1,
          backgroundColor2: _backgroundColor2,
          iconColor: _iconColor,
        ),
        '/profile_page': (context) => MyProfilePage(
          backgroundColor1: _backgroundColor1,
          backgroundColor2: _backgroundColor2,
          iconColor: _iconColor,
        ),
        '/salary': (context) => SalaryPage(),
        '/leaves': (context) => LeavesPage(),
        '/requests': (context) => RequestsPage(),
        '/attendance': (context) => AttendancePage(),
        '/settings': (context) => SettingsPage(
          backgroundColor1: _backgroundColor1,
          backgroundColor2: _backgroundColor2,
          iconColor: _iconColor,
        ),
        '/settings_themes': (context) => SettingsThemesPage(
          updateTheme: _updateTheme,
          initialBackgroundColor1: _backgroundColor1,
          initialBackgroundColor2: _backgroundColor2,
          initialIconColor: _iconColor,
        ),
      },
      builder: (context, child) {
        // Make the status bar transparent
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ));
        return Scaffold(
          drawer: AppDrawer(iconColor: _iconColor),
          body: child,
        );
      },
    );
  }
}

// Dummy pages for routing
class SalaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Salary Page')),
    );
  }
}

class LeavesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Leaves Page')),
    );
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Requests Page')),
    );
  }
}

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Attendance Page')),
    );
  }
}
