import 'package:flutter/material.dart';
import '../styles/styles.dart'; // Ensure correct import path

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationsPressed;

  TopBar({
    required this.title,
    required this.onMenuPressed,
    required this.onNotificationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Your Company',
              style: AppStyles.appBarTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set to bold and black
              ),
            ),
            TextSpan(
              text: ' - $title',
              style: AppStyles.appBarTextStyle.copyWith(
                color: Colors.black, // Set to black
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: onNotificationsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
