import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/call_button_component.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/image_otp_component.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/pin_component.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../core/functions/show_toast.dart';
import '../../screens/signup/views/signup_screen.dart';

class OtpScreen extends StatefulWidget {
  final int? id;

  OtpScreen({Key? key, this.id}) : super(key: key);

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  int resendAttempts = 0;
  late Timer _resendTimer;
  int remainingTime = 900; // 15 minutes in seconds
  bool showCallButton = false;

  @override
  void dispose() {
    _resendTimer.cancel();
    super.dispose();
  }

  // Function to start the timer for 3 attempts
  void startResendTimer() {
    const duration = Duration(seconds: 1);
    _resendTimer = Timer.periodic(duration, (timer) {
      if (resendAttempts < 3) {
        resendAttempts++;
      } else {
        timer.cancel();
        setState(() {
          showCallButton = true;
        });
      }

      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }
  String formatRemainingTime() {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.otpBlue,
      body: Form(
        key: OtpScreen._key,
        child: Stack(
          children: [
            const ImageOtpComponent(),
            ListView(
              children: [
                Padding(
                  padding: context.isRTL
                      ? EdgeInsets.only(right: 30.w ,top: 325.h, bottom: 10.h,)
                      : EdgeInsets.only(left: 30.w , top: 325.h, bottom: 10.h,),
                  child: Text(AppStrings.enterCode, style: AppTextStyle.cairoBold25white),
                ),
                Padding(
                  padding: context.isRTL
                      ? EdgeInsets.only(right: 30.w)
                      : EdgeInsets.only(left: 30.w),
                  child: Text(
                    AppStrings.codeSent,
                    style: AppTextStyle.cairoSemiBold16white,
                  ),
                ),
                SizedBox(height: 3.h,),
                Padding(
                  padding: context.isRTL
                      ? EdgeInsets.only(right: 30.w)
                      : EdgeInsets.only(left: 30.w),
                  child: Text("mobile", style: AppTextStyle.cairoSemiBold16white),
                ),
                SizedBox(height: 15.h,),
                if (resendAttempts >= 3)
                  TweenAnimationBuilder<Duration>(
                    duration: Duration(minutes: 15),
                    tween: Tween(begin: Duration(minutes: 15), end: Duration.zero),
                    onEnd: () {
                      print('Timer ended');
                    },
                    builder: (BuildContext context, Duration value, Widget? child) {
                      final minutes = value.inMinutes;
                      final seconds = value.inSeconds % 60;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '$minutes:$seconds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      );
                    },
                  ),

                PinComponent(pinController: pinController),
                BlocConsumer<OtpCubit, OtpState>(
                  listener: (context, state) {
                    if (state is OtpSuccess) {
                      if(state.otpmodel.error ?? false){
                        showToast(
                            message: state.otpmodel.message ?? 'Registered successfully',
                            bcColor: Colors.green);
                        Navigator.pushNamed(context, RouteName.mainScreen);
                      }

                     else  {
                      showToast(message: state.otpmodel.message ?? 'Check otp code', bcColor: Colors.red);
                    }
                  }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(332.w, 46.h),
                          backgroundColor: AppColors.darkRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                        onPressed: () async {
                          if (OtpScreen._key.currentState!.validate()) {
                            isLogin = true;
                            await OtpCubit.get(context).verifyOtp(otp: pinController.text);
                          }
                        },
                        child: Text(
                          AppStrings.submit,
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                      ),
                    );
                  },
                ),
                BlocConsumer<OtpCubit, OtpState>(
                  listener: (context, state) {
                    if (state is ResendSuccess) {


                      if(state.resendModel.error ?? false){
                        showToast(
                            message: state.resendModel.message ?? '',
                            bcColor: Colors.green);
                        Navigator.pushNamed(context, RouteName.mainScreen);
                      }

                      else  {
                        showToast(message: state.resendModel.message ?? 'Check otp code', bcColor: Colors.red);
                      }


                    }
                  },
                  builder: (context, state) {
                    if (state is ResendSuccess) {
                      // Show the timer, countdown, and CallButton when there is a ResendFailure
                      return Column(
                        children: [
                          if (showCallButton) const CallButton() ,

                        ],
                      );
                    } else {
                      // Show the button for ResendSuccess and ResendLoading
                      return Padding(
                        padding: EdgeInsets.only(right: 120.w , left: 120.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          //minimumSize: Size(50.w, 46.h),
                            backgroundColor: AppColors.buttonOtp,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          onPressed: () {
                            startResendTimer(); // Start the timer when the button is pressed
                            // Resend logic goes here
                           OtpCubit.get(context).resendOtp(id: widget.id);
                          },
                          child: Text(
                            AppStrings.resendCode,
                            style: AppTextStyle.cairoNormal13white,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


