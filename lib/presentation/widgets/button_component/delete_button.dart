import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';


import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key , required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(top:10 , bottom: 10, left:40 , right: 40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(332, 46),
            backgroundColor: AppColors.darkRed,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ), onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(Assets.imagesPersonImg),
              SizedBox(width: 5.w),
              Text(AppStrings.deleteAccount , style: AppTextStyle.cairoSemiBold16white ,),
            ],
          ),
          //onPressed: isLoading ? null : function ,
        ),
      ),
    );
  }
}
