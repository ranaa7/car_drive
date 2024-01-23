import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
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

class LoginScreen extends StatefulWidget {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();


  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {

        // if (state is LoginSuccessState ) {
        //   if (kDebugMode) {
        //     print('TOOKKEEN ${state.loginModel.token}');
        //   }
        //   showToast(
        //       message: state.loginModel.message ?? 'Successfully logged in',
        //       bcColor: Colors.green);
        //   // token = state.loginModel.token!;
        //   // print('Token before saving: $token');
        //   userId = state.loginModel.user!.id!.toString();
        //   await CacheHelper.saveDate(key: 'user_id', value: userId);
        //   CacheHelper.saveDate(
        //       key: 'access_token', value: state.loginModel.token)
        //       .then((value) =>
        //   {Navigator.pushNamed(context, RouteName.mainScreen)});
        // }

        if (state is LoginSuccessState || state is SocialLoginSuccessState) {
          if (kDebugMode) {
            print('TOKEN: ${(state as dynamic).loginModel.token}');
          }

          showToast(
            message: (state as dynamic).loginModel.message ?? 'Successfully logged in',
            bcColor: Colors.green,
          );

          userId = (state as dynamic).loginModel.user?.id?.toString() ?? ''; // Safely retrieve user ID
          await CacheHelper.saveDate(key: 'user_id', value: userId);

          String? accessToken = state is LoginSuccessState
              ? state.loginModel.token
              : (state as SocialLoginSuccessState).loginModel.token;

          CacheHelper.saveDate(key: 'access_token', value: accessToken)
              .then((value) => Navigator.pushNamed(context, RouteName.mainScreen));
        }

      },
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        resizeToAvoidBottomInset: false,
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
                padding: const EdgeInsets.only(
                        left: 34, right: 30, top: 10, bottom: 10)
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
                    key: LoginScreen._key,
                    child: (Column(
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
                              onPressed: state is LoginLoadingState
                                  ? null
                                  : ()  {
                                      if (LoginScreen._key.currentState!.validate()) {
                                        isLogin = true;
                                         LoginCubit.get(context).userLogin(
                                            email: emailcontroller.text,
                                            password: passwordcontroller.text);
                                        //await CacheHelper.saveDate(key: 'access_token', value: token);

                                        String? token = CacheHelper.getData(
                                            key: 'access_token');

                                        CacheHelper.saveDate(
                                            key: 'islogged', value: islogged);

                                        print('Retrieved Token: $token');
                                        if (kDebugMode) {
                                          print('UserTOOK $token');
                                        }
                                        Navigator.pushNamed(
                                            context, RouteName.mainScreen);
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

                        const SignupButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        // const AppleButton(),
                        SizedBox(
                          height: 4.h,
                        ),

                        OutlinedButton(
                          onPressed: ()  async{
                            try {
                              GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                              if (googleUser != null) {
                                print("displayName ${googleUser.displayName}");
                                print("email ${googleUser.email}");
                                print("googleUser.id ${googleUser.id}");

                                GoogleSignInAuthentication googleSignInAuthentication =
                                await googleUser.authentication;
                                String? accessToken = googleSignInAuthentication.accessToken;
                                print("accessToken $accessToken");



                                LoginCubit.get(context).getSocialLoginResponse(
                                  "google",
                                  googleUser.displayName ?? "",
                                  googleUser.email,
                                  googleUser.id,
                                  access_token: accessToken,
                                );

                                // Disconnect to sign out the user (optional)
                                await GoogleSignIn().disconnect();
                              } else {
                                // Handle case when the user cancels the sign-in process
                                print("Google Sign-In canceled");
                              }
                            } catch (error) {
                              print("Google Sign-In error: $error");
                              // Handle the error
                            }
                           },

                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(332.w, 46.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            side: const BorderSide(color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Assets.imagesGoogleImg),
                              Text(
                                'قم بتسجيل الدخول باستخدام Google',
                                style: AppTextStyle.cairoSemiBold16black,
                              ),
                            ],
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
