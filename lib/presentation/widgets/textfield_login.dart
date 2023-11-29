import 'package:flutter/material.dart';

import '../../config/style/app_colors.dart';
import '../../config/style/text_styles.dart';
import '../../config/validationform.dart';

class TextfieldLoginComponent extends StatelessWidget {
   TextfieldLoginComponent({super.key , required this.right , required this.left , required this.text , required this.controller , required this.validation});
  var controller = TextEditingController();
  double right;
  double left;
  String text;
  String? validation;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
      padding: const EdgeInsets.only(right: 0 , left: 130),
      child: Text(text , style: AppTextStyle.cairoSemiBold16DarkBlue,),
    ),
      SizedBox(height: 12,),
      TextFormField(

        controller: controller,
        validator: ValidationForm.emailValidator,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide:
            BorderSide(color: AppColors.orangeBorder ,),

          ),


        ),
      ),],);
  }
}
