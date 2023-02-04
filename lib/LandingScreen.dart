import 'package:flutter/material.dart';
import 'package:flutter_expenseapp/pages/page1.dart';
import 'package:flutter_expenseapp/pages/page2.dart';
import 'package:flutter_expenseapp/pages/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_expenseapp/pages/homepage.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  PageController _controller = PageController();

  bool lastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              lastpage = (index == 2);
            });
          },
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text("skip"), 
                ),
                SmoothPageIndicator(controller: _controller, count: 3),

                //nextpage
                lastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                        child: Text("End"),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeIn);
                        },
                        child: Text("next"),
                      ),
              ],
            ))
      ],
    ));
  }
}
