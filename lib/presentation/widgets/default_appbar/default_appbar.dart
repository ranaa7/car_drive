import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final bool isBack;
  const DefaultAppBar({super.key, this.isBack=false});

  @override
  Widget build(BuildContext context) {
    return  isBack?IconButton(icon:const Icon(Icons.arrow_back_rounded), onPressed: () {
      Navigator.popAndPushNamed(context, RouteName.navBar);
    },):Container(
      color: AppColors.appbarBackGround,
      height: 99.h,
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.searchForAllNeeds, style: AppTextStyle.cairoBold11,),
          SizedBox(height: 14.h,),
          InkWell(
            child: Container(
              width: 334.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color:  AppColors.white,),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 26.0.w,),
                child: Row(children: [
                  Text(AppStrings.search,style: AppTextStyle.cairoMedium14,),
                  const Spacer(),
                  const Icon(Icons.search),
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 99.h);
}
