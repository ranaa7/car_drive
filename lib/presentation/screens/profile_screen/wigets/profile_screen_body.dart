import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/strings/app_strings.dart';
import '../../../../utils/strings/routes_names.dart';
import '../../login/view_models/login_cubit.dart';
import '../view_models/counter/counter_cubit.dart';
import 'column_profile.dart';
import 'icon_container.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 370.h,
          decoration: const BoxDecoration(
            color: AppColors.deepDarkBlue,
            borderRadius: BorderRadius.only(
                // topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
                //topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 30.h),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (LocalizeAndTranslate.getLanguageCode() ==
                                'ar') {
                              LocalizeAndTranslate.setLanguageCode('en');
                              print(
                                  'new lang: en -- context.locale: ${context.locale}');
                            } else {
                              LocalizeAndTranslate.setLanguageCode('ar');
                              print(
                                  'new lang: ar -- context.locale: ${context.locale}');
                            }
                          },
                          icon: Image.asset(Assets.imagesTranslateIcon)),
                      const Spacer(),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return OutlinedButton(
                            onPressed: () {
                              LoginCubit.get(context).userLogOut(context);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(20.w, 30.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: Text(
                              'Logout',
                              style: AppTextStyle.cairoSemiBold16white,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                LoginCubit.get(context)
                                        .loginModel
                                        .user
                                        ?.username ??
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
                              LoginCubit.get(context).loginModel.user?.email ??
                                  "",
                              style:
                                  const TextStyle(fontSize: 14, color: Colors.grey)),
                          // Text(LoginCubit.get(context).loginModel.user?.id?.toString() ??""),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 200.w,
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
                                const Text("668997"),
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
                                                        Image.asset(Assets
                                                            .imagesLibreGiftlogo),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Container(
                                                          width: 200.w,
                                                          height: 47.h,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                AppColors.white,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              const Text("668997"),
                                                              const Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: const Icon(Icons
                                                                      .copy_outlined)),
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
                                                                  icon: const Icon(
                                                                    Icons
                                                                        .facebook,
                                                                    color: Colors
                                                                        .blue,
                                                                  )),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: const FaIcon(
                                                                    FontAwesomeIcons
                                                                        .whatsapp,
                                                                    color: Colors
                                                                        .greenAccent,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15.h,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.copy_outlined)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.referralCode,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileColumn(
              name: "wishlist",
              num: CounterCubit.get(context).wishlistItem.toString(),
            ),

            Container(
              height: 50.h,
              width: 0.4.w, // Adjust the width as needed
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            ProfileColumn(
              name: "Cart",
              num: CounterCubit.get(context).cartItem.toString(),
            ),

            Container(
              height: 50.h,
              width: 0.4.w, // Adjust the width as needed
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            ProfileColumn(
              name: "Order",
              num: CounterCubit.get(context).orderCount.toString(),
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          height: 100.h,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.myWishlist, icon: Icons.favorite),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(
                text: AppStrings.myOrders, icon: Icons.list_alt_outlined),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.myWallet, icon: Icons.wallet),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.address, icon: Icons.location_on),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(
                text: AppStrings.earnedPoints, icon: FontAwesomeIcons.coins),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.messages, icon: Icons.chat_rounded),
            SizedBox(
              width: 10.w,
            ),
          ]),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
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
                  "All",
                  style: AppTextStyle.cairoSemiBold17Red,
                ))
          ],
        ),
      ],
    );
  }
}
