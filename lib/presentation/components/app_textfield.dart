import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController? controller;
  final bool obscureText, readOnly;
  final TextInputType textInput;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon, fixIcon;

  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit, onChanged;
  final List<TextInputFormatter> inputFormatter;
  final int? maxLines;
  final int? maxLength;

  const AppTextFormField({
    super.key,
    this.inputFormatter = const [],
    this.textInput = TextInputType.text,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onTap,
    this.icon,
    this.fixIcon,
    this.onChanged,
    this.textAlign,
    this.contentPadding,
    this.onSubmit,
    this.readOnly = false, this.maxLines, this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      minLines: 1,
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      inputFormatters: inputFormatter,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      keyboardType: textInput,
      textAlign: context.isRTL?TextAlign.end:TextAlign.start,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      obscuringCharacter: "*",
      style: AppTextStyle.cairoMedium14Grey,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: context.isRTL?TextDirection.ltr:TextDirection.rtl,
        labelText: labelText,
        floatingLabelStyle: AppTextStyle.cairoBold11black,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: icon,
        suffixIcon: fixIcon,
        filled: true,
        fillColor: AppColors.grey3,
        border:OutlineInputBorder(
            borderSide: BorderSide(width: 0.0.w,color: AppColors.grey3),
            borderRadius: BorderRadius.circular(10.r)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0.w,color: AppColors.grey3),
            borderRadius: BorderRadius.circular(10.r)
        ),
        hintStyle: AppTextStyle.cairoMedium14Grey,
        labelStyle: AppTextStyle.cairoMedium14Black,
        enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(width: 0.0.w,color: AppColors.grey3),
            borderRadius: BorderRadius.circular(10.r)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0.w,color: AppColors.grey3),
            borderRadius: BorderRadius.circular(10.r)

        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0.w,color: AppColors.grey3),
            borderRadius: BorderRadius.circular(10.r)
        ),
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 10.h, right: 20.w, bottom: 10.h, left: 10.w),

        // labelText: labelText,
      ),
    );
  }
}
