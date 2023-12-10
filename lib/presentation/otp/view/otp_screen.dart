import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/home/home_screen.dart';
import 'package:more_2_drive/presentation/home_screen.dart';
import 'package:more_2_drive/presentation/otp/data/models/otp_model.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/call_button_component.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/image_otp_component.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/pin_component.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/functions/show_toast.dart';
import '../../../core/network/local/cache_helper.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key , required this.id});

  int? id;
  var pinController = TextEditingController();

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Stack(children: [

          ImageOtpComponent(),
          ListView(

            children: [
              Padding(
                padding: EdgeInsets.only(top: 325.h, bottom: 10.h, right: 30),
                child: Text(
                    "ادخل الكود", style: AppTextStyle.cairoBold25white),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 25.w,
                  //bottom: 10.h,
                  //top: 10.h,
                ),
                child: Text("تم إرسال رمز مكون من 6 أرقام إلى",
                    style: AppTextStyle.cairoSemiBold16white),
              ),

              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.only(

                  right: 25.w,
                  // bottom: 10.h,
                  // top: 510.h,
                ),
                child: Text(
                    "mobile",
                    style: AppTextStyle.cairoSemiBold16white),
              ),
              SizedBox(height: 50.h,),

              PinComponent(pinController: pinController),

              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is OtpSuccess) {
                    showToast(
                        message: state.otpmodel.message ??
                            'Registered successfully',
                        bcColor: Colors.green);
                    Get.to(() => HomeScreen());
                  } else if (state is OtpFailure) {
                    showToast(message: state.errMessage, bcColor: Colors.red);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(25),
                    child: ElevatedButton(
                        child: Text(
                          "تاكيد", style: AppTextStyle.cairoSemiBold16white,),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(332.w, 46.h),
                          backgroundColor: AppColors.darkRed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.r))),
                        ), onPressed: () async {
                      if (_key.currentState!.validate()) {
                        await OtpCubit.get(context).verifyOtp(
                            otp: pinController.text);
                        // String? token =
                        // CacheHelper.getData(key: 'access_token');
                        // if (kDebugMode) {
                        //   print('UserTOOK $token');
                        // }
                      }
                    }
                    ),
                  );
                },
              ),


              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is ResendSuccess) {
                    showToast(
                        message: state.resendModel.message ??
                            '',
                        bcColor: Colors.green);

                  }
                  else if (state is ResendFailure)
                  {
                    showToast(message: state.errMessage, bcColor: Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is ResendFailure) {
                    // Show CallButton when there is a ResendFailure
                    return CallButton();
                  } else {
                    // Show the button for ResendSuccess and ResendLoading
                    return Padding(
                      padding: EdgeInsets.only(left: 100, right: 100).w,
                      child: OutlinedButton(
                        onPressed: () {

                         OtpCubit.get(context).ResendOtp(id: id );
                        },
                        child: Text(
                          'اعادة ارسال الرمز',
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.r),
                            ),
                          ),
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    );
                  }
                },


                  )



            ],
          )


        ],),
      ),
    );
  }
}
