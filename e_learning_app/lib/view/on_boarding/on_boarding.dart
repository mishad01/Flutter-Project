import 'package:e_learning_app/resources/app_colors.dart';
import 'package:e_learning_app/view/auth/sign_in/sign_in_view.dart';
import 'package:e_learning_app/view/intro/intro_view_1.dart';
import 'package:e_learning_app/view/intro/intro_view_2.dart';
import 'package:e_learning_app/view/intro/intro_view_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
              });
            },
            children: [
              IntroView1(),
              IntroView2(),
              IntroView3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: onLastPage ? Text(" ") : Text("Skip"),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ScrollingDotsEffect(),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(SignInView());
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: AppColors.themeColor,
                                foregroundColor: Colors.white),
                            child: Text("Get Started")),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next"),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
