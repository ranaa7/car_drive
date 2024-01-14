import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

import 'package:more_2_drive/presentation/screens/login_profile_screen/views/widgets/login_profile_column.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../../config/style/text_styles.dart';
import '../../../utils/strings/routes_names.dart';

class LoginProfileScreen extends StatelessWidget {
  const LoginProfileScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      body: SafeArea(

        child: Align(
          alignment: Alignment.center,
          
          child: Column(
        
            children: [

            const LoginProfileColumn(),
          const SizedBox(height: 60,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(332, 46),
              backgroundColor: AppColors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ), onPressed: () {
            Navigator.pushNamed(context, RouteName.signupScreen);
          },
            child: Text( AppStrings.signIn , style: AppTextStyle.cairoSemiBold16black,),
            //onPressed: isLoading ? null : function ,
          ),
              const SizedBox(height: 30,),
              Text(AppStrings.signIn , style: const TextStyle(fontSize:16 , color: Colors.white ),),

        
        
        
        
          ],),
        ),
      ),
    );
  }
}
