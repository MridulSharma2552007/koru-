import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:koru/Colors/app_colors.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border(top: BorderSide(color: Colors.white.withAlpha(3))),

            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
