import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../config/style/text_styles.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    ElevatedButton(
      child: Text("قم بتسجيل الدخول باستخدام Apple" , style: AppTextStyle.cairoSemiBold16white ,),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(332, 46),
        backgroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () async{
        final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print(credential);
    },
      //onPressed: isLoading ? null : function ,
    );
  }
}
