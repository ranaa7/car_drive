import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/screens/onboarding/view/widgets/onboarding_list_screen.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.transparent),
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
                          1.0
                        ])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 56.h, left: 19.w, right: 10.w),
                child: SmoothPageIndicator(
                  controller: controller!,
                  count: 4,
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
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 520.h, left: 9.w, right: 20.w, bottom: 60.h),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.imagesMore2driveLogo,
                      // height: 154,
                      // width: 406,
                      //fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10,
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
                              'انشاء حساب',
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
                            CacheHelper.saveDate(key: "onboarding", value: true)
                                .then((value) {
                              if ((value)) {
                                Navigator.pushNamed(
                                    context, RouteName.loginScreen);
                              }
                            });
                          },
                          child: Text(
                            'تسجيل دخول',
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
                              'تخطي',
                              style: AppTextStyle.cairoSemiBold16white,
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
