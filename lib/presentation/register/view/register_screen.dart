import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';

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
            Positioned(
                //left: 100,
                top: -32.h,
                left: 24.w,
                height: 291.h,
                width: 400.w,
                child: Image.asset(Assets.imagesLoginTire)),
            Positioned(
                top: 80.h,
                left: 35.w,
                height: 122.h,
                width: 318.w,
                child: Image.asset(Assets.imagesLoginLogo)),
            Positioned(
                top: 184.h,
                left: 120.w,
                height: 58.h,
                width: 147.w,
                child: Image.asset(Assets.imagesLoginText)),
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
                      TextFormField(
                        controller: _email,
                        validator: (value) {
                          if (ValidationForm.emailValidator(value) != null) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:  EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 3.w),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.r),
                            borderSide: const BorderSide(
                              color: AppColors.orangeBorder,
                            ),
                          ),
                        ),
                      ),
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
                      TextFormField(
                        controller: _email,
                        validator: (value) {
                          if (ValidationForm.emailValidator(value) != null) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:  EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 3.w),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.r),
                            borderSide: const BorderSide(
                              color: AppColors.orangeBorder,
                            ),
                          ),
                        ),
                      ),
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
                      IntlPhoneField(
                        dropdownDecoration:
                            const BoxDecoration(color: AppColors.white),
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:  EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 3.w),
                          // labelText: 'Phone Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              7.r,
                            ),
                            borderSide: BorderSide(
                              color: AppColors.orangeBorder,
                            ),
                          ),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      Row(
                       // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_box,
                                color: AppColors.darkRed,
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "أوافق على ",
                                  style: AppTextStyle.cairoSemiBold12DarkBlue,
                                ),
                                TextSpan(
                                  text: "الشروط والأحكام و سياسة الخصوصية",
                                  style: AppTextStyle.cairoSemiBold12DarkRed,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),



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
