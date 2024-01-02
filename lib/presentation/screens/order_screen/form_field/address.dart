import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/presentation/components/app_textfield.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
   AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.address,style: AppTextStyle.cairoSemiBold15Grey,),
        SizedBox(height: 10.h,),
        AppTextFormField(
          textInput: TextInputType.multiline,
          maxLines: 3,
          maxLength: 100,
          controller: addressController,
          validator: ValidationForm.nameValidator,
        ),
      ],
    );
  }
}
