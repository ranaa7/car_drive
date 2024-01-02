import 'package:flutter/material.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../config/style/app_colors.dart';
import '../../../config/style/text_styles.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({super.key , required this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(332, 46),
          backgroundColor: AppColors.darkRed,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ), onPressed: onPressed,
        child: Text(AppStrings.deleteAccount , style: AppTextStyle.cairoSemiBold16white ,),
        //onPressed: isLoading ? null : function ,
      ),
    );
  }
}
