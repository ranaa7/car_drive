import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as DateFormatter;
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../utils/strings/app_strings.dart';

class OrderPickUpTimeScreen extends StatefulWidget {
  const OrderPickUpTimeScreen({super.key});

  @override
  State<OrderPickUpTimeScreen> createState() => _OrderPickUpTimeScreenState();
}

class _OrderPickUpTimeScreenState extends State<OrderPickUpTimeScreen> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;
  List<DateTime> pickupDates = <DateTime>[
    DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 2, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 3, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 4, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 5, 0, 0),
    DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 6, 0, 0),
  ];

  List<DateTime> pickupTimes = <DateTime>[
    DateTime.utc(0, 0, 0, 10, 0),
    DateTime.utc(0, 0, 0, 11, 0),
    DateTime.utc(0, 0, 0, 12, 0),
    DateTime.utc(0, 0, 0, 13, 0),
    DateTime.utc(0, 0, 0, 14, 0),
    DateTime.utc(0, 0, 0, 15, 0),
    DateTime.utc(0, 0, 0, 16, 0),
    DateTime.utc(0, 0, 0, 17, 0),
    DateTime.utc(0, 0, 0, 18, 0),
    DateTime.utc(0, 0, 0, 19, 0),
    DateTime.utc(0, 0, 0, 20, 0),
    DateTime.utc(0, 0, 0, 21, 0),
    DateTime.utc(0, 0, 0, 22, 0),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime pickupTime = DateTime(
      pickupDates[selectedDateIndex].year,
      pickupDates[selectedDateIndex].month,
      pickupDates[selectedDateIndex].day,
      pickupTimes[selectedTimeIndex].hour,
      pickupTimes[selectedTimeIndex].minute,
    );
    return Scaffold(
        bottomNavigationBar: Button1(
            height: 50,
            width: 300,
            onPressed: () {
              OrderCubit.get(context).updatePickupDateInCart(pickupTime);
              OrderCubit.get(context).getPaymentTypes();
              OrderCubit.get(context).getCartSummary();
              Navigator.pushNamed(context, RouteName.orderPaymentMethod);
            },
            text: AppStrings.continue1,
            color: AppColors.red3),
        appBar: DefaultAppBar(
          title: AppStrings.choosePickup,
        ),
        body: Column(
          crossAxisAlignment: context.isRTL?CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(AppStrings.choosePickupDay,style: AppTextStyle.cairoMedium14Black,),
            ),
            SizedBox(height: 15.h,),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                mainAxisSpacing: 4.h,
                crossAxisSpacing: 4.w,
                childAspectRatio: 2,
                children: pickupDates
                    .asMap()
                    .map((index, value) => MapEntry(
                          index,
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDateIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.red3,width: 1.1.w),
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: selectedDateIndex == index
                                      ? AppColors.red3
                                      : AppColors.white),
                              child: Center(
                                child: Text(
                                  "${DateFormatter.DateFormat("dd MMMM").format(value)}",
                                  style: selectedDateIndex == index
                                      ? AppTextStyle.cairoBold16White
                                      : AppTextStyle.cairoBold17Red,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(AppStrings.choosePickupTime,style: AppTextStyle.cairoMedium14Black,),
            ),
            SizedBox(height: 15.h,),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                mainAxisSpacing: 4.h,
                crossAxisSpacing: 4.w,
                childAspectRatio: 2,
                children: pickupTimes
                    .asMap()
                    .map((index, value) => MapEntry(
                          index,
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedTimeIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.red3,width: 1.1.w),
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: selectedTimeIndex == index
                                      ? AppColors.red3
                                      : AppColors.white),
                              padding: EdgeInsets.all(4),
                              child: Center(
                                child: Text(
                                  "${DateFormatter.DateFormat("h:mm a").format(value)}",
                                  style: selectedTimeIndex == index
                                      ? AppTextStyle.cairoBold16White
                                      : AppTextStyle.cairoBold17Red,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
