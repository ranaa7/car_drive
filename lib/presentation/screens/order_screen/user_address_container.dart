import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class UserAddressContainer extends StatelessWidget {
  final String address;
  final String city;
  final int selectedIndex;
  final int index;
  final String state;
  final String country;
  final String postalCode;
  final String phone;
  const UserAddressContainer({super.key, required this.address, required this.city, required this.state, required this.country, required this.postalCode, required this.phone, required this.selectedIndex, required this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
        width: 386.w,
        height: 230.h,
        decoration: BoxDecoration(
          boxShadow: AppShadows.shadow3,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: selectedIndex==index ? AppColors.red : AppColors.white, width: 1.w),
            color: Colors.white),
      child: Row(
        children: [
          Column(children: [
            Text(AppStrings.address,style: AppTextStyle.cairoMedium14Grey,),
            Text(AppStrings.city,style: AppTextStyle.cairoMedium14Grey,),
            Text(AppStrings.state,style: AppTextStyle.cairoMedium14Grey,),
            Text(AppStrings.country,style: AppTextStyle.cairoMedium14Grey,),
            Text(AppStrings.postalCode,style: AppTextStyle.cairoMedium14Grey,),
            Text(AppStrings.phone,style: AppTextStyle.cairoMedium14Grey,),
          ],
          ),
          const Spacer(),
          Column(children: [
            Text(address,style: AppTextStyle.cairoMedium14Black,),
            Text(city,style: AppTextStyle.cairoMedium14Black,),
            Text(state,style: AppTextStyle.cairoMedium14Black,),
            Text(country,style: AppTextStyle.cairoMedium14Black,),
            Text(postalCode,style: AppTextStyle.cairoMedium14Black,),
            Text(phone,style: AppTextStyle.cairoMedium14Black,),
          ],
          )
        ],
      ),
    );
  }
}
