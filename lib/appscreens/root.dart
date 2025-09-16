import 'package:flutter/material.dart';
import 'package:koru/NavBar/navbar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(bottomNavigationBar: Navbar()),
    );
  }
}
