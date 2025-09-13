import 'package:flutter/material.dart';
import 'package:koru/pageview/page_one.dart';
import 'package:koru/pageview/page_three.dart';
import 'package:koru/pageview/page_two.dart';

class PageViewpage extends StatefulWidget {
  const PageViewpage({super.key});

  @override
  State<PageViewpage> createState() => _PageViewpageState();
}

class _PageViewpageState extends State<PageViewpage> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          PageOne(controller: controller),
          PageTwo(controller: controller),
          PageThree(controller: controller),
        ],
      ),
    );
  }
}
