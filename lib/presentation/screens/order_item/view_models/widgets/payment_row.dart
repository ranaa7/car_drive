import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/style/text_styles.dart';

class PaymentRowComponent extends StatelessWidget {
  const PaymentRowComponent({super.key , required this.text1 , required this.text2});
 final String text1;
 final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment:
      MainAxisAlignment
          .spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 120.w),
          child: Text(
            text1,
            style: AppTextStyle.cairoBoldgrey20,
          ),
        ),
        Text(
          text2,
          style: AppTextStyle.cairoBoldgrey20,
        ),
      ],
    );

  }
}
