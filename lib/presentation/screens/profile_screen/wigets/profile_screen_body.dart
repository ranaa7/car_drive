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

class profileScreenBody extends StatelessWidget {
  const profileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 370.h,
          decoration: BoxDecoration(
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
                      Spacer(),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.editProfilescreen);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.penToSquare,
                                    color: AppColors.white,
                                  )),
                            ],
                          ),
                          Text(
                              LoginCubit.get(context).loginModel.user?.email ??
                                  "",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          // Text(LoginCubit.get(context).loginModel.user?.id?.toString() ??""),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 200.w,
                            height: 47.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Text("668997"),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              width: double.infinity,
                                              child: new Wrap(
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
                                                              BoxDecoration(
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
                                                              Text("668997"),
                                                              Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(Icons
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
                                                                  icon: Icon(
                                                                    Icons
                                                                        .facebook,
                                                                    color: Colors
                                                                        .blue,
                                                                  )),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: FaIcon(
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
                                    icon: Icon(Icons.copy_outlined)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.ReferralCode,
                            style: TextStyle(color: Colors.white),
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
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            ProfileColumn(
              name: "wishlist",
              num: CounterCubit.get(context).wishlistItem.toString(),
              left: 80,
            ),
            SizedBox(
              width: 20,
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
              left: 20,
            ),
            SizedBox(
              width: 20.w,
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
              left: 20,
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          height: 100.h,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.MyWishlist, icon: Icons.favorite),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(
                text: AppStrings.MyOrders, icon: Icons.list_alt_outlined),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.MyWallet, icon: Icons.wallet),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(text: AppStrings.address, icon: Icons.location_on),
            SizedBox(
              width: 10.w,
            ),
            IconContainer(
                text: AppStrings.EarnedPoints, icon: FontAwesomeIcons.coins),
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
            Spacer(),
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
