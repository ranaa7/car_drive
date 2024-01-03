import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/presentation/components/app_textfield.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class PostalCodeForm extends StatelessWidget {
  final TextEditingController controller;
   const PostalCodeForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.postalCode,style: AppTextStyle.cairoSemiBold15Grey,),
        SizedBox(height: 10.h,),
        AppTextFormField(

          controller: controller,
          validator: ValidationForm.nameValidator,
        ),
      ],
    );
  }
}
