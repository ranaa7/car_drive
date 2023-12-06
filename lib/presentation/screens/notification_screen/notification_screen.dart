import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List notification=[] ;
    return  Scaffold(
      appBar: DefaultAppBar(title:AppStrings.notification ,),
      body: notification.isEmpty?Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(svgPath: Assets.svgEmptyNotificaion,fit: BoxFit.contain,height: 280.h,width: 260.w,),
           SizedBox(height: 30.h,),
            SizedBox(width:330.w,child: Text(AppStrings.emptyNotification,style: AppTextStyle.cairoMedium20Grey,textAlign: TextAlign.center,))
          ],
        ),
      ):const SizedBox()
    );
  }
}
