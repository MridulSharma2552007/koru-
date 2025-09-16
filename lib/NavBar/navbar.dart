import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:koru/appscreens/flashcards.dart';
import 'package:koru/appscreens/home.dart';
import 'package:koru/appscreens/stats.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0; // default index

  final List<Widget> _screens = [Home(), Flashcards(), Stats()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // show screen based on index
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // update page
          });
        },
        backgroundColor: Colors.blueAccent,
        color: Colors.white.withValues(alpha: 0.2),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home),
          Icon(Icons.crop_landscape_rounded),
          Icon(Icons.bar_chart_rounded),
        ],
      ),
    );
  }
}
