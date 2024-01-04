import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

class SizedBoxRadio extends StatelessWidget {
  final int value;

  final Widget? child;

  final int? groupValue;
  final void Function(int?)? onChanged;

  final double? height;

  const SizedBoxRadio(
      {super.key,
      required this.child,
      required this.value,
      this.groupValue,
      this.onChanged,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30.h,
      child: RadioMenuButton(
        value: value,
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(AppColors.blue),
          foregroundColor: MaterialStatePropertyAll(AppColors.blue),
            iconColor: MaterialStatePropertyAll(AppColors.blue),
            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        groupValue: groupValue,
        onChanged: onChanged,
        child: child,
      ),
    );
  }
}
