import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsThemesPage extends StatefulWidget {
  final Function(Color, Color, Color) updateTheme;
  final Color initialBackgroundColor1;
  final Color initialBackgroundColor2;
  final Color initialIconColor;

  SettingsThemesPage({
    required this.updateTheme,
    required this.initialBackgroundColor1,
    required this.initialBackgroundColor2,
    required this.initialIconColor,
  });

  @override
  _SettingsThemesPageState createState() => _SettingsThemesPageState();
}

class _SettingsThemesPageState extends State<SettingsThemesPage> {
  late Color _backgroundColor1;
  late Color _backgroundColor2;
  late Color _iconColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor1 = widget.initialBackgroundColor1;
    _backgroundColor2 = widget.initialBackgroundColor2;
    _iconColor = widget.initialIconColor;
  }

  void _pickBackgroundColor1() async {
    Color? color = await showDialog(
      context: context,
      builder: (context) => ColorPickerDialog(initialColor: _backgroundColor1),
    );
    if (color != null) {
      setState(() {
        _backgroundColor1 = color;
        widget.updateTheme(_backgroundColor1, _backgroundColor2, _iconColor);
      });
    }
  }

  void _pickBackgroundColor2() async {
    Color? color = await showDialog(
      context: context,
      builder: (context) => ColorPickerDialog(initialColor: _backgroundColor2),
    );
    if (color != null) {
      setState(() {
        _backgroundColor2 = color;
        widget.updateTheme(_backgroundColor1, _backgroundColor2, _iconColor);
      });
    }
  }

  void _pickIconColor() async {
    Color? color = await showDialog(
      context: context,
      builder: (context) => ColorPickerDialog(initialColor: _iconColor),
    );
    if (color != null) {
      setState(() {
        _iconColor = color;
        widget.updateTheme(_backgroundColor1, _backgroundColor2, _iconColor);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Themes')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_backgroundColor1, _backgroundColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pick background color 1:'),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickBackgroundColor1,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: _backgroundColor1,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Pick background color 2:'),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickBackgroundColor2,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: _backgroundColor2,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Pick icon color:'),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickIconColor,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: _iconColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  widget.updateTheme(_backgroundColor1, _backgroundColor2, _iconColor);
                },
                child: Text('Update Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final Color initialColor;

  ColorPickerDialog({required this.initialColor});

  @override
  Widget build(BuildContext context) {
    Color _pickerColor = initialColor;

    return AlertDialog(
      title: Text('Pick a color'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: _pickerColor,
          onColorChanged: (color) {
            _pickerColor = color;
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('PICK'),
          onPressed: () {
            Navigator.of(context).pop(_pickerColor);
          },
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor1 = Colors.white;
  Color _backgroundColor2 = Colors.green;
  Color _iconColor = Colors.green;

  void _updateTheme(Color backgroundColor1, Color backgroundColor2, Color iconColor) {
    setState(() {
      _backgroundColor1 = backgroundColor1;
      _backgroundColor2 = backgroundColor2;
      _iconColor = iconColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _iconColor,
        scaffoldBackgroundColor: _backgroundColor1,
        secondaryHeaderColor: _backgroundColor2,
      ),
      home: SettingsThemesPage(
        updateTheme: _updateTheme,
        initialBackgroundColor1: _backgroundColor1,
        initialBackgroundColor2: _backgroundColor2,
        initialIconColor: _iconColor,
      ),
    );
  }
}
