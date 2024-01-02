import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/widgets/setting_widgets/setting_radio_button.dart';

class PaymentContainer extends StatelessWidget {
  final int index;
  final int value;
  final int selectedIndex;

  const PaymentContainer({super.key, required this.index, required this.selectedIndex, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 150.h,
      width: 400.w,
      decoration: BoxDecoration(
        border: Border.all(color: selectedIndex==index?AppColors.blue:AppColors.white,width: 1.1.w),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: AppShadows.shadow3),
      child: Row(
        children: [
          CustomImageView(
            height: 100.h,
            width: 100.w,
            url: OrderCubit.get(context).paymentTypes[index].image ?? '',
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            width: 5.w,
            height: 10.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue,
            ),
          ),
          Container(
            height: 2.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: AppColors.blue,
            ),
          ),
          Container(
            width: 5.w,
            height: 10.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue,
            ),
          ),
          Spacer(),
          SettingRadioButton(value: value, text: "")
        ],
      ),
    );
  }
}
