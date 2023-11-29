import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';
import 'package:more_2_drive/presentation/widgets/form_field/email_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/password_formfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 336.h,
              bottom: 0.h,
              child: Container(
                width: 430.w,
                height: 596.h,
                decoration: BoxDecoration(color: AppColors.white),
                child:   Container(),
              )),
         ImageComponent(),


          Positioned(
            left: 30.w,
            right: 30.w,
            bottom: 20.h,
            top: 259.h,
            child: Container(
              padding:
                  EdgeInsets.only(left: 34, right: 30, top: 10, bottom: 10).r,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 10,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ).w,
              ),
              child:
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: (Column(
                  children: [

                    SizedBox(height: 12.h,),
                    // width: 111px
                    // height: 58px
                    // top: 270px
                    // left: 276px

                    Padding(
                       padding: const EdgeInsets.only(right: 0 , left: 130).r,
                       child: Text("البريد الالكتروني" , style: AppTextStyle.cairoSemiBold16DarkBlue,),
                     ),
                    SizedBox(height: 12.h,),
                    EmailFormField(),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding: const EdgeInsets.only(right: 0 , left: 130),
                      child: Text("كلمة السر" , style: AppTextStyle.cairoSemiBold16DarkBlue,),
                    ),
                    SizedBox(height: 12,),
                    PasswordFormField(),
                    SizedBox(height: 15,),

                    ButtonComponent(text: "تسجيل دخول", colors:  AppColors.deepDarkBlue),
                    SizedBox(height: 4.h,),
                    Row(children: [Expanded(child: Divider()) , Text("خيارات التسجيل") , Expanded(child: Divider())],),
                    SizedBox(height: 4.h,),
                    ButtonComponent(text: "سجل برقم هاتف", colors:  AppColors.darkRed),
                    SizedBox(height: 4.h,),

                    ButtonComponent(text: "سجل عن طريق البريد الالكتروني", colors:  AppColors.blueCielButton),
                    SizedBox(height: 4.h,),

                    ButtonComponent(text: "قم بتسجيل الدخول باستخدام Apple", colors:  AppColors.black),
                    SizedBox(height: 4.h,),

                    OutlinedButton(onPressed: (){}, child:
                    Text('قم بتسجيل الدخول باستخدام Google' , style: AppTextStyle.cairoSemiBold16black ,),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(332.w, 46.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r), ),


                        ),
                        side: BorderSide( color: Colors.black),

                      ),

                    ),



                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
