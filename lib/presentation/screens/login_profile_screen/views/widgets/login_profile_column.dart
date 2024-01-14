import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/strings/app_strings.dart';

class LoginProfileColumn extends StatelessWidget {
  const LoginProfileColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
     //SizedBox(height: 5.h,),
        Image.asset(Assets.imagesLockLogo , width: 60.w,),
         SizedBox(height: 20.h,),
        Text(AppStrings.signIn , style: const TextStyle(fontSize:32 , color: Colors.white ),),

        Text(AppStrings.activate , style: const TextStyle(fontSize:32 , color: Colors.white ),),
        const SizedBox(height: 90,),
        const Divider(thickness: 0, color: Colors.white,),
        Padding(
          padding:  EdgeInsets.only(left: 20.w , right: 20.w),
          child: Row(


            children: [
              const Expanded(child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.watch_later_outlined, color: Colors.white,))),
              Text(AppStrings.date, style: const TextStyle(fontSize:20 , color: Colors.grey ),),


            ],
          ),
        ),
        const Divider(thickness: 0, color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 20.w , right: 20.w),
          child: Row(

            children: [
              const Expanded(child: Align(
                  alignment:Alignment.topLeft,
                  child: Icon(Icons.construction, color: Colors.white,))),
              Text(AppStrings.point, style: const TextStyle(fontSize:20 , color: Colors.grey ),),


            ],
          ),
        ),
        const SizedBox(height: 10,),
        const Divider(thickness: 0, color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 20.w , right: 20.w),
          child: Row(


            children: [
              const Expanded(child: Align(
                alignment: Alignment.topLeft,
                child:FaIcon(FontAwesomeIcons.coins , color: Colors.white,),)),
              Text(AppStrings.services, style: const TextStyle(fontSize:20 , color: Colors.grey ),),


            ],
          ),
        ),
        const Divider(thickness: 0, color: Colors.white,),
      ],
    );
  }
}
