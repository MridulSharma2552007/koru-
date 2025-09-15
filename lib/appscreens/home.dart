import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:koru/NavBar/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = '';
  @override
  void initState() {
    super.initState();
    getName();
  }

  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("userName");
    setState(() {
      userName = name ?? "Guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            top: true,
            bottom: false,
            child: LayoutBuilder(
              builder: (context, Constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: Constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          topwidget(userName: userName),
                          SizedBox(height: 20),
                          Expanded(child: homescreenconatiner()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(bottom: 10, left: 10, right: 10, child: Navbar()),
        ],
      ),
    );
  }
}

class homescreenconatiner extends StatelessWidget {
  const homescreenconatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 0, 0, 0), Colors.blueAccent],
          begin: Alignment.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class topwidget extends StatelessWidget {
  const topwidget({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Hello',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              userName,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
