// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/style/app_colors.dart';

class PinComponent extends StatelessWidget {
  PinComponent({super.key , required this.pinController});
  var pinController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return
         Padding(
           padding:  EdgeInsets.only(left: 20.w , right: 20.w),
           child: Pinput(
             length: 6,

             controller: pinController ,
             validator: ValidationForm.otpValidator,
             defaultPinTheme: defaultPinTheme,
             onCompleted: (pin) => print(pin),
             keyboardType: TextInputType.text,


           ),
         );

  }
}
//left: 30.w,
// right: 30.w,
// bottom: 20.h,
// top: 570.h,