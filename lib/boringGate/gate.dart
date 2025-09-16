import 'package:flutter/material.dart';
import 'package:koru/appscreens/home.dart';
import 'package:koru/appscreens/root.dart';
import 'package:koru/pageview/page_viewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gate extends StatefulWidget {
  const Gate({super.key});

  @override
  State<Gate> createState() => _GateState();
}

bool settedName = false;

class _GateState extends State<Gate> {
  Future<void> checkbypass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedvalue = prefs.getBool('settedName') ?? false;
    setState(() {
      settedName = storedvalue;
    });
  }

  @override
  void initState() {
    super.initState();
    checkbypass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: settedName ? Root() : PageViewpage());
  }
}
