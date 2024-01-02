import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class Button1 extends StatelessWidget {
  final int height;
  final int width;
  final Color color;
  final VoidCallback onPressed;
  final String text;

  const Button1(
      {super.key,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: color,
          ),
          height: height.h,
          width: width.w,
          child: Center(
            child: Text(
                        text,
                        style: AppTextStyle.cairoBold24White,
                      ),
          )),
    );
  }
}
