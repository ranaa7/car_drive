import 'package:flutter/material.dart';

import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(332, 46),
        backgroundColor: AppColors.darkRed,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () {

    },
      child: Text("Delete account" , style: AppTextStyle.cairoSemiBold16white ,),
      //onPressed: isLoading ? null : function ,
    );
  }
}
