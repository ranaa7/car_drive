import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/register/view/widgets/privacy_row_component.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';
import 'package:more_2_drive/presentation/widgets/form_field/first_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/last_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/phone_formfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 336.h,
                bottom: 0.h,
                child: Container(
                  width: 430.w,
                  height: 596.h,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: const Column(
                    children: [],
                  ),
                )),
            ImageComponent(),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 90.h,
              top: 259.h,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 34, right: 30, top: 10, bottom: 10).r,
                decoration:  BoxDecoration(
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
                child: SingleChildScrollView(
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding:EdgeInsets.only(right: 0, left: 130).r,
                        child: Text(
                          "الاسم الاول",
                          style: AppTextStyle.cairoSemiBold16DarkBlue,
                        ),
                      ),
                       SizedBox(
                        height: 12.h,
                      ),
                      FirstNameFormfield(),
                       SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0, left: 130).r,
                        child: Text(
                          "الاسم التاني",
                          style: AppTextStyle.cairoSemiBold16DarkBlue,
                        ),
                      ),
                       SizedBox(
                        height: 12.h,
                      ),
                      LastNameFormfield(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0, left: 130).r,
                        child: Text(
                          "رقم الهاتف",
                          style: AppTextStyle.cairoSemiBold16DarkBlue,
                        ),
                      ),
                       SizedBox(
                        height: 12.h,
                      ),
                      PhoneFormfield(),
                      PrivacyRoComponent(),



                       SizedBox(height: 12.h,),

                        ButtonComponent(text: "انشاء حساب", colors: AppColors.darkRed)
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
