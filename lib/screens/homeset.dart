import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:techijou_app/screens/home_screen.dart';
import 'package:techijou_app/screens/post.dart';
import 'package:techijou_app/screens/profile.dart';

class Homeset extends StatefulWidget {
  @override
  _HomesetState createState() => _HomesetState();
}

class _HomesetState extends State<Homeset> {
  int index = 1;

  final screens = [
    PostScreen(),
    HomeScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black45,
        index: index,
        color: Colors.black87,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 40,
            color: Colors.white,
          ),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
