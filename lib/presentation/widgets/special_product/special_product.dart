import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/product/product_list.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class SpecialProduct extends StatelessWidget {
  const SpecialProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image:DecorationImage(image: AssetImage(Assets.imagesNew,),fit: BoxFit.cover)
      ),
      height: 365.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:17.0.w),
            child: Text(AppStrings.specialProduct,style: AppTextStyle.cairoSemiBold17White,),
          ),
          SizedBox(height: 10.h,),
         const ProductList(),
        ],
      ),
    );
  }
}
