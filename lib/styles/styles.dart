import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const EdgeInsets globalMargin = EdgeInsets.all(16.0);

  static BoxDecoration globalBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.white, Colors.lightGreen],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0, 4),
        blurRadius: 10.0,
      ),
    ],
  );

  static void updateGlobalGradient(Color startColor, Color endColor) {
    globalBoxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [startColor, endColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 4),
          blurRadius: 10.0,
        ),
      ],
    );
  }

  static final TextStyle headerTextStyle = GoogleFonts.kanit(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle subHeaderTextStyle = GoogleFonts.kanit(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle contentTextStyle = GoogleFonts.kanit(
    fontSize: 16.0,
    color: Colors.white,
  );

  static final BoxDecoration timeInButtonDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.green,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );

  static final BoxDecoration timeOutButtonDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.red,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );

  static const BoxConstraints buttonContainerConstraints = BoxConstraints(
    minHeight: 200.0,
    minWidth: 200.0,
    maxHeight: 200.0,
    maxWidth: 200.0,
  );

  static final TextStyle appBarTextStyle = GoogleFonts.kanit(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle drawerTextStyle = GoogleFonts.kanit(
    fontSize: 18.0,
    color: Colors.black,
  );
}
