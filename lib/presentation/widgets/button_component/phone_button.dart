import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:more_2_drive/presentation/register/view/register_screen.dart';

import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';
import '../../../utils/strings/routes_names.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      child: Text("سجل برقم الهاتف" , style: AppTextStyle.cairoSemiBold16white ,),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(332, 46),
        backgroundColor: AppColors.darkRed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () {
      Get.to(() =>  RegisterScreen());
    },
      //onPressed: isLoading ? null : function ,
    );
  }
}
