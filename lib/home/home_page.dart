import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/top_bar.dart';
import '../widgets/drawer.dart';
import '../styles/styles.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color iconColor;

  HomePage({
    this.backgroundColor1 = Colors.white,
    this.backgroundColor2 = Colors.green,
    this.iconColor = Colors.green,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isTimeIn = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 3.14).animate(_controller);
  }

  void _toggleTimeIn() {
    setState(() {
      if (_isTimeIn) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isTimeIn = !_isTimeIn;
    });

    // Navigate to the MapPage with some example coordinates (replace with dynamic coordinates)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(
          latitude: 37.7749, // example latitude
          longitude: -122.4194, // example longitude
          backgroundColor1: widget.backgroundColor1,
          backgroundColor2: widget.backgroundColor2,
          iconColor: widget.iconColor,
        ),
      ),
    );

    // Debug print to check if the method is called
    print('Time In button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBar(
        title: 'Home',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onNotificationsPressed: () {
          // Add notification action here
        },
      ),
      drawer: AppDrawer(iconColor: widget.iconColor),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.backgroundColor1, widget.backgroundColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header with profile picture and full name
            Container(
              margin: AppStyles.globalMargin,
              padding: AppStyles.globalMargin,
              decoration: BoxDecoration(
                color: widget.backgroundColor2,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Full Name
                      Text(
                        'Full Name', // Replace with dynamic user name
                        style: AppStyles.headerTextStyle,
                      ),
                      // Profile Picture
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(
                            'assets/CROPIMAG_PROFILE.JPG'), // Ensure this path matches your asset
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // Shift Information
                  Text(
                    'Shift: 8:00 AM - 5:00 PM', // Replace with dynamic shift information
                    style: AppStyles.contentTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Current Time
            Center(
              child: Text(
                '12:00 PM', // Replace with dynamic time
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            // Current Day and Date
            Center(
              child: Text(
                'Monday, July 28, 2024', // Replace with dynamic day and date
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Carousel
            Expanded(
              child: Padding(
                padding: AppStyles.globalMargin,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  items: [
                    'assets/dashboard.png',
                    'assets/employee.png',
                    'assets/Screenshot 2024-07-22 011726.png',
                  ]
                      .map((item) => Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Time In/Time Out Button
            Padding(
              padding: AppStyles.globalMargin,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _toggleTimeIn,
                    child: Container(
                      constraints: AppStyles.buttonContainerConstraints,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: _isTimeIn ? Colors.green : Colors.red,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _animation.value,
                                child: Icon(
                                  Icons.hourglass_bottom,
                                  size: 50.0,
                                  color: _isTimeIn ? Colors.green : Colors.red,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            _isTimeIn ? 'Time In' : 'Time Out',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: _isTimeIn ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
