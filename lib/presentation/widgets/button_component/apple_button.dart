// import 'package:flutter/material.dart';
// import 'package:more_2_drive/config/style/app_colors.dart';
// import 'package:more_2_drive/config/style/text_styles.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
//
// class AppleButton extends StatelessWidget {
//   const AppleButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return    ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(332, 46),
//         backgroundColor: AppColors.black,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//       ), onPressed: () async{
//         final credential = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//     );
//
//     print(credential);
//     },
//       child: Text("قم بتسجيل الدخول باستخدام Apple" , style: AppTextStyle.cairoSemiBold16white ,),
//       //onPressed: isLoading ? null : function ,
//     );
//   }
// }
