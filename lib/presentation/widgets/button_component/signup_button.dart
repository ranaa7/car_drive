import 'package:flutter/material.dart';

import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(332, 46),
        backgroundColor: AppColors.blueCielButton,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () {
      Navigator.pushNamed(context, RouteName.signupScreen);
    },
      child: Text("سجل عن طريق البريد الالكتروني" , style: AppTextStyle.cairoSemiBold16white ,),
      //onPressed: isLoading ? null : function ,
    );
  }
}
