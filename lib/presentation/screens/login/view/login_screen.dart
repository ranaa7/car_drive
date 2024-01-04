import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/widgets/button_component/phone_button.dart';
import 'package:more_2_drive/presentation/widgets/button_component/signup_button.dart';
import 'package:more_2_drive/presentation/widgets/form_field/email_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/password_formfield.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../../core/app_constants/constants.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../signup/views/signup_screen.dart';
import '../view_models/login_cubit.dart';



class LoginScreen extends StatelessWidget {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async{
          if (state is LoginSuccessState) {
            if (kDebugMode) {
              print('TOOKKEEN ${state.loginModel.token}');
            }
            showToast(
                message: state.loginModel.message ?? 'Successfully logged in',
                bcColor: Colors.green);
            // token = state.loginModel.token!;
            // print('Token before saving: $token');
                userId = state.loginModel.user!.id!.toString();
                await CacheHelper.saveDate(key: 'user_id', value: userId);
            CacheHelper.saveDate(key: 'access_token', value: state.loginModel.token)
                .then((value) => { Navigator.pushNamed(context, RouteName.mainScreen)});
          }

        },
      child: Scaffold(

        backgroundColor: AppColors.darkBlue,
        body: Stack(
          children: [
            Positioned(
                top: 336.h,
                bottom: 0.h,
                child: Container(
                  width: 430.w,
                  height: 596.h,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Container(),
                )),
            const ImageComponent(),
            Positioned(
              left: 30.w,
              right: 30.w,
              bottom: 20.h,
              top: 259.h,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 34, right: 30, top: 10, bottom: 10)
                        .r,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, //New
                      blurRadius: 10,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ).w,
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Form(
                    key: _key,
                    child: (
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "البريد الالكتروني",
                          style: AppTextStyle.cairoSemiBold16DarkBlue,
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
                        Text(
                          "كلمة السر",
                          style: AppTextStyle.cairoSemiBold16DarkBlue,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PasswordFormField(
                          password: passwordcontroller,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                           BlocBuilder<LoginCubit, LoginState>(
                             buildWhen: (previous, current) =>
                             current is LoginLoadingState ||
                                 current is LoginFailureState ||
                                 current is LoginSuccessState,
                           builder: (context, state) {

                                 return ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     minimumSize: const Size(332, 46),
                                     backgroundColor: AppColors.deepDarkBlue,
                                     shape: const RoundedRectangleBorder(
                                         borderRadius:
                                         BorderRadius.all(Radius.circular(10))),
                                   ),
                                   onPressed:
                                   state is LoginLoadingState ? null : () async {
                                     if (_key.currentState!.validate()) {
                                       islogin=true;
                                       await LoginCubit.get(context).userLogin(
                                           email: emailcontroller.text,
                                           password: passwordcontroller.text);
                                       //await CacheHelper.saveDate(key: 'access_token', value: token);

                                       String? token =
                                       CacheHelper.getData(key:'access_token');

                                       CacheHelper.saveDate(key: 'islogged', value: islogged);

                                       print('Retrieved Token: $token');
                                       if (kDebugMode) {
                                         print('UserTOOK $token');
                                       }
                                       Navigator.pushNamed(context, RouteName.mainScreen);

                                     }
                                   },
                                   child: Text(
                                     "تسجيل دخول",
                                     style: AppTextStyle.cairoSemiBold16white,
                                   ),

                                 );



  },
),

                        SizedBox(
                          height: 4.h,
                        ),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Text("خيارات التسجيل"),
                            Expanded(child: Divider())
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        const PhoneButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        SignupButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        // const AppleButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(332.w, 46.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            side: const BorderSide(color: Colors.black),
                          ),
                          child: Text(
                            'قم بتسجيل الدخول باستخدام Google',
                            style: AppTextStyle.cairoSemiBold16black,
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


