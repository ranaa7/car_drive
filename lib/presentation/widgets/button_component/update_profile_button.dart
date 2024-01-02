import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';

class UpdateProfileButton extends StatelessWidget {
  UpdateProfileButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: context.isRTL
          ? EdgeInsets.only(right: 10.w)
          : EdgeInsets.only(left: 200.w),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 40),
          backgroundColor: AppColors.darkRed,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ), onPressed: onPressed ,
        child: Text(AppStrings.updateprofile,
          style: AppTextStyle.cairoSemiBold16white,),

      ),
    );

  }
}