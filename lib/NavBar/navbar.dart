import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) {},
      backgroundColor: Colors.blueAccent,

      color: Colors.white.withOpacity(0.2),
      animationDuration: Duration(milliseconds: 300),

      items: [
        Icon(Icons.home),
        Icon(Icons.crop_landscape_rounded),
        Icon(Icons.bar_chart_rounded),
      ],
    );
  }
}
