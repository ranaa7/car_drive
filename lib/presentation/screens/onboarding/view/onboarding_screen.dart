import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/screens/onboarding/view/widgets/onboarding_list_screen.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      // Auto-scroll to the next page every 5 seconds
      if (currentIndex < contents.length - 1) {
        controller.nextPage(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      } else {
        t.cancel(); // Cancel the timer when reaching the last page
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Other widgets in the stack...

          GestureDetector(
            onTap: () {
              // If the user presses, cancel the auto-scroll timer
              timer.cancel();
              // If the current index is not the last page, animate to the next page
              if (currentIndex < contents.length - 1) {
                controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
                // Handle the last page, e.g., navigate to another screen
                CacheHelper.saveDate(key: "onboarding", value: true).then((value) {
                  if ((value)) {
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  }
                });
              }
            },
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.transparent),
                      child: Image.asset(
                        contents[index].image,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: const [
                            0.0,
                            1.0,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 570.h, left: 9.w, right: 20.w, bottom: 60.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.imagesMore2driveLogo,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(contents[index].title,
                              style: AppTextStyle.cairoSemiBold24white),
                          Text(contents[index].discription,
                              style: AppTextStyle.cairoSemiBold24white),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: OutlinedButton(
                                  onPressed: () {
                                    CacheHelper.saveDate(
                                        key: "onboarding", value: true)
                                        .then((value) {
                                      if ((value)) {
                                        Navigator.pushNamed(
                                            context, RouteName.signupScreen);
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(0.w, 36.h),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                  child: Text(
                                    AppStrings.register,
                                    style: AppTextStyle.cairoSemiBold16white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(0.w, 36.h),
                                  backgroundColor: AppColors.blueButton,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                ),
                                onPressed: () {
                                  CacheHelper.saveDate(
                                      key: "onboarding", value: true)
                                      .then((value) {
                                    if ((value)) {
                                      Navigator.pushNamed(
                                          context, RouteName.loginScreen);
                                    }
                                  });
                                },
                                child: Text(
                                  AppStrings.signIn,
                                  style: AppTextStyle.cairoSemiBold16white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  CacheHelper.saveDate(
                                      key: "onboarding", value: true)
                                      .then((value) {
                                    if ((value)) {
                                      Navigator.pushNamed(
                                          context, RouteName.mainScreen);
                                    }
                                  });
                                },
                                child: Text(
                                  AppStrings.skip,
                                  style: AppTextStyle.cairoSemiBold16white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmoothPageIndicator(
        controller: controller,
        count: contents.length,
        axisDirection: Axis.horizontal,
        effect: SlideEffect(
            spacing: 5,
            radius: 15,
            dotWidth: 90.w,
            dotHeight: 4.h,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.w,
            dotColor: Colors.grey,
            activeDotColor: Colors.white),
      ),
    );
  }
}
