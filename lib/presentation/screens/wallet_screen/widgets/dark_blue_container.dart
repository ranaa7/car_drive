import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/strings/app_strings.dart';

class DarkBlueContainer extends StatelessWidget {
  const DarkBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: AppColors.deepDarkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [

            Positioned.fill(
             left: -85,
                top: -150,
                right: -90.w,
                bottom: -30.h,
                child: Image.asset(Assets.imagesCoinsGroup ,
                  fit: BoxFit.fill,),

            ),

            Positioned(
              //right: 70,
                //bottom: 0,
                top: 185.h,
                left: 175.w,
                child: Text(AppStrings.totalPoints , style: AppTextStyle.cairoMedium16White,)),

            Positioned(
              //right: 70,
                bottom: 0,
                top: 190.h,
                left: 170.w,
                child: Text("5000" , style: AppTextStyle.cairoBold48White,)),
            Padding(
              padding:  EdgeInsets.only(top: 260.h , left: 20.w),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // minimumSize:
                    // const Size(90, 36),
                    backgroundColor:
                    AppColors.red3,
                    shape:
                    const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius
                                .circular(
                                10))),
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    AppStrings.collectPoints,
                    style: AppTextStyle
                        .cairoSemiBold16white,
                  ),
                  //onPressed: isLoading ? null : function ,
                ),
              ),
            )


          ]),
        ],
      ),
      height: 350.h,
      width: double.infinity,
    );
  }
}
