import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/validationform.dart';

class FirstNameFormfield extends StatelessWidget {
 FirstNameFormfield({super.key , required this.fname});
  var fname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fname,
      validator: ValidationForm.nameValidator,
       keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:  EdgeInsets.symmetric(
            vertical: 6.h, horizontal: 3.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: const BorderSide(
            color: AppColors.orangeBorder,
          ),
        ),
      ),
    );
  }
}
