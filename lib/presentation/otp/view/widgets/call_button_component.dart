import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/text_styles.dart';
import '../../../../generated/assets.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   OutlinedButton(
      onPressed: () {},
      child: Row(
        children: [
          Text(
            'في حالة عدم وصول الرمز اتصل بخدمة العملاء',
            style: AppTextStyle.cairoSemiBold16white,
          ),
          Flexible(child: Image.asset(Assets.imagesCallCenterIcon,width: 30.w,)),

        ],
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(332, 46),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        side: BorderSide(color: Colors.grey),
      ),
    );
  }
}
