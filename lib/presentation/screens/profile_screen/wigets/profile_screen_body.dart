import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../../utils/strings/routes_names.dart';
import '../../login/view_models/login_cubit.dart';
import '../view_models/counter/counter_cubit.dart';
import 'column_profile.dart';
import 'icon_container.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {

  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350.h,
          decoration: const BoxDecoration(
            color: AppColors.deepDarkBlue,
            borderRadius: BorderRadius.only(
                // topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
                //topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: context.isRTL
                        ? EdgeInsets.only(right: 20.0.w)
                        : EdgeInsets.only(left: 10.0.w),
                    child: IconButton(
                        onPressed: () {
                          if (LocalizeAndTranslate.getLanguageCode() == 'ar') {
                            LocalizeAndTranslate.setLanguageCode('en');
                            print(
                                'new lang: en -- context.locale: ${context.locale}');
                          } else {
                            LocalizeAndTranslate.setLanguageCode('ar');
                            print(
                                'new lang: ar -- context.locale: ${context.locale}');
                          }
                        },
                        icon: Image.asset(Assets.imagesTranslateIcon , ),iconSize: 40,
                    ),

                  ),

                   // Spacer(),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Padding(
                        padding:  context.isRTL
                            ? EdgeInsets.only(left: 15.0.w)
                            : EdgeInsets.only(right: 15.0.w),
                        child: OutlinedButton(
                          onPressed: () {
                            LoginCubit.get(context).userLogOut(context);
                          },
                          style: OutlinedButton.styleFrom(
                           minimumSize: Size(20.w, 30.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),
                            side: const BorderSide(color: Colors.white),
                          ),
                          child: Text(
                            AppStrings.logout,
                            style: AppTextStyle.cairoSemiBold16white,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.imagesCarLogo),
                  BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                UpdateProfileCubit.get(context)
                                        .userDataByAccessToken
                                        .name ??
                                    "",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.editProfilescreen);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.penToSquare,
                                    color: AppColors.white,
                                  )),
                            ],
                          ),
                          Text(
                              UpdateProfileCubit.get(context)
                                      .userDataByAccessToken
                                      .email ??
                                  "",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                          // Text(LoginCubit.get(context).loginModel.user?.id?.toString() ??""),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 220.w,
                            height: 47.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: context.isRTL
                                      ? EdgeInsets.only(right: 15.0.w)
                                      : EdgeInsets.only(left: 15.0.w),
                                  child: const Text("668997"),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return SizedBox(
                                              width: double.infinity,
                                              child: Wrap(
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Image.asset(Assets
                                                            .imagesNewGift),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Container(
                                                          width: 300.w,
                                                          height: 47.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 1),
                                                            color:
                                                                AppColors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                context.isRTL
                                                                    ? EdgeInsets.only(right: 15.0.w)
                                                                    : EdgeInsets.only(left: 15.0.w),
                                                                child: Text(
                                                                  "668997",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .blue[
                                                                          900]),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Image.asset(Assets.imagesSquareImg),)
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                       Image.asset(Assets.imagesNewFacebook),
                                                                iconSize:55,

                                                                  ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                  Image.asset(Assets.imagesNewWp) , iconSize: 70,),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(AppStrings.inviteYourFriends , style: AppTextStyle.cairoSemiBold17Black,),
                                                        SizedBox(height: 10.h,),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: Image.asset(Assets.imagesSquareImg),),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.referralCode,
                            style: AppTextStyle.cairoNormal13white,
                          )
                        ],
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileColumn(
                  name:AppStrings.wishlist,
                  num: CounterCubit.get(context).wishlistItem.toString(),
                ),
                Container(
                  height: 50.h,
                  width: 0.4.w, // Adjust the width as needed
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                ProfileColumn(
                  name: AppStrings.cart,
                  num: CounterCubit.get(context).cartItem.toString(),
                ),
                Container(
                  height: 50.h,
                  width: 0.4.w, // Adjust the width as needed
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                ProfileColumn(
                  name: AppStrings.orders,
                  num: CounterCubit.get(context).orderCount.toString(),
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          height: 95.h,
          child: ListView(scrollDirection: Axis.horizontal,
              controller: pageController,
              children: [
            SizedBox(
              width: 10.w,
            ),
            IconContainer(
              text: AppStrings.myWishlist,
              icon: Icons.favorite,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.wishlistScreen);
              },
            ),
            SizedBox(
              width: 30.w,
            ),
            IconContainer(
              text: AppStrings.myOrders,
              icon: Icons.list_alt_outlined,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.orderScreen);
              },
            ),
            SizedBox(
              width: 30.w,
            ),
            IconContainer(
              text: AppStrings.myWallet,
              icon: Icons.wallet,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.walletScreen);
              },
            ),
            SizedBox(
              width: 30.w,
            ),
            IconContainer(
              text: AppStrings.address,
              icon: Icons.location_on,
              onPressed: () {},
            ),
            SizedBox(
              width: 30.w,
            ),
            IconContainer(
              text: AppStrings.earnedPoints,
              icon: FontAwesomeIcons.coins,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.clubPointsScreen);
              },
            ),
            SizedBox(
              width: 30.w,
            ),
            IconContainer(
              text: AppStrings.messages,
              icon: Icons.chat_rounded,
              onPressed: () {},
            ),
            SizedBox(
              width: 30.w,
            ),
          ]),

        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2, // Replace with the total number of pages
              effect: ColorTransitionEffect(activeDotColor: AppColors.deepDarkBlue), // Change color as needed
            ),
          ),
        ),

        Row(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: context.isRTL
                      ? EdgeInsets.only(right: 20.0.w)
                      : EdgeInsets.only(left: 10.0.w),
                  child: Text(
                    AppStrings.yourOrders,
                    style: AppTextStyle.cairoSemiBold16black,
                  ),
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.orderScreen);
                },
                child: Text(
                  AppStrings.all,
                  style: AppTextStyle.cairoSemiBold17Red,
                ))
          ],
        ),
      ],
    );
  }
}
