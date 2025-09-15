import 'dart:ui';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border(
              top: BorderSide(color: Colors.white.withAlpha(100)),
              bottom: BorderSide(color: Colors.black.withAlpha(100)),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home_rounded, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search_rounded, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
