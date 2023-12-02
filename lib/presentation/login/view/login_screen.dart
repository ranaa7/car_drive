import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/home/home_screen.dart';
import 'package:more_2_drive/presentation/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';
import 'package:more_2_drive/presentation/widgets/button_component/apple_button.dart';
import 'package:more_2_drive/presentation/widgets/button_component/phone_button.dart';
import 'package:more_2_drive/presentation/widgets/form_field/email_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/password_formfield.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/functions/show_toast.dart';
import '../../../core/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (kDebugMode) {
            print('TOOKKEEN ${state.loginModel.token}');
          }
          showToast(
              message: state.loginModel.message ?? 'Successfully logged in',
              bcColor: Colors.green);
          token = state.loginModel.token!;

          CacheHelper.saveDate(key: 'token', value: state.loginModel.token)
              .then((value) => {Get.to(() => const homeScreen())});
        } else if (state is LoginFailureState) {
          showToast(message: state.errMessage, bcColor: Colors.red);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 336.h,
                bottom: 0.h,
                child: Container(
                  width: 430.w,
                  height: 596.h,
                  decoration: BoxDecoration(color: AppColors.white),
                  child: Container(),
                )),
            ImageComponent(),
            Positioned(
              left: 30.w,
              right: 30.w,
              bottom: 20.h,
              top: 259.h,
              child: Container(
                padding:
                    EdgeInsets.only(left: 34, right: 30, top: 10, bottom: 10)
                        .r,
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
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Form(
                    key: _key,
                    child: (
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 130).r,
                          child: Text(
                            "البريد الالكتروني",
                            style: AppTextStyle.cairoSemiBold16DarkBlue,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        EmailFormField(
                          email: emailcontroller,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 130),
                          child: Text(
                            "كلمة السر",
                            style: AppTextStyle.cairoSemiBold16DarkBlue,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        PasswordFormField(
                          password: passwordcontroller,
                        ),
                        SizedBox(
                          height: 15,
                        ),

                           ElevatedButton(
                              child: Text(
                                "تسجيل دخول",
                                style: AppTextStyle.cairoSemiBold16white,
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(332, 46),
                                backgroundColor: AppColors.deepDarkBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  await LoginCubit.get(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);
                                  print(emailcontroller);
                                  print(passwordcontroller);
                                  String? token =
                                      CacheHelper.getData(key: 'token');
                                  if (kDebugMode) {
                                    print('UserTOOK $token');
                                  }
                                }
                              },

                            ),

                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Text("خيارات التسجيل"),
                            Expanded(child: Divider())
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        PhoneButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        ButtonComponent(
                            text: "سجل عن طريق البريد الالكتروني",
                            colors: AppColors.blueCielButton),
                        SizedBox(
                          height: 4.h,
                        ),

                        AppleButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'قم بتسجيل الدخول باستخدام Google',
                            style: AppTextStyle.cairoSemiBold16black,
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(332.w, 46.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


