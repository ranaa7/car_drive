import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final int height;
  final  Color? color;
  final int width;
  final  Widget child;
  const CustomContainer({super.key, required this.child, required this.height, required this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child:child,
    );
  }
}
