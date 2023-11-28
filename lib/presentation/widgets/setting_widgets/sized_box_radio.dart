import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height ?? 30.h,
          child: RadioMenuButton(
            value: value,
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            groupValue: groupValue,
            onChanged: onChanged,
            child: child,
          ),
        ),
      ],
    );
  }
}
