import 'package:flutter/material.dart';
import 'package:koru/Colors/app_colors.dart';
import 'package:koru/appscreens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Infoscreen extends StatefulWidget {
  const Infoscreen({super.key});

  @override
  State<Infoscreen> createState() => _InfoscreenState();
}

class _InfoscreenState extends State<Infoscreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String name = '';
  Future<void> credentialsSaver() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", name);
  }

  void homepageredirector() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Top section
                      SizedBox(
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "Let's get personal 👋",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Koru would love to know your name - what should we call you ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Align(
                              alignment: Alignment(0, 1),
                              child: Image.asset(
                                'assets/Microanimations/info.gif',
                                height: 250,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 50,
                            ),
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: "Enter your name",
                              ),
                              onSubmitted: (value) {
                                setState(() {
                                  name = _textEditingController.text;
                                });
                                credentialsSaver();
                                homepageredirector();
                                print("your name is $name");
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
