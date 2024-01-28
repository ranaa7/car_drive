import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key , required this.text , required this.icon , required this.onPressed });
  final IconData icon;
  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:90.h,
      width: 80.w,
      decoration: const BoxDecoration(
        color: AppColors.deepDarkBlue,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),

      child: Column(
        children: [
          IconButton(icon: Icon(icon , size: 30.w,) , color: Colors.white, onPressed: onPressed,),
       //   const Spacer(),
          Text(text,style: const TextStyle(fontSize: 9 , color: Colors.white),)
        ],),
    );
  }
}
