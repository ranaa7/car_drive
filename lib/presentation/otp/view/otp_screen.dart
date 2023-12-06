import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/home/home_screen.dart';
import 'package:more_2_drive/presentation/otp/data/models/otp_model.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/image_otp_component.dart';
import 'package:more_2_drive/presentation/otp/view/widgets/pin_component.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/functions/show_toast.dart';
import '../../../core/network/local/cache_helper.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  otpModel? otpmodel;
  var pinController = TextEditingController();

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          if (kDebugMode) {
            print('TOOKKEEN ${state.otpmodel.data?.token}');
          }
          showToast(
              message: state.otpmodel.message ?? 'check your SMS',
              bcColor: Colors.green);
          token = state.otpmodel.data!.token!;

          CacheHelper.saveDate(key: 'access_token', value: state.otpmodel.data?.token)
              .then((value) => {Get.to(() => const homeScreen())});
        } else if (state is OtpFailure) {
          showToast(message: state.errMessage, bcColor: Colors.red);
        }
        // TODO: implement listener
      },
      child:
      Scaffold(
        body: Form(
          key: _key,
          child: Stack(children: [

            ImageOtpComponent(),
           ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Padding(
                 padding:  EdgeInsets.only(top: 390.h , bottom: 10.h   ,  right: 30 ),
                 child: Text(
                     "ادخل الكود", style: AppTextStyle.cairoBold25white),
               ),
               Padding(
                 padding:  EdgeInsets.only(
                   right: 25.w,
                   //bottom: 10.h,
                   //top: 10.h,
                    ),
                 child: Text("تم إرسال رمز مكون من 6 أرقام إلى",
                     style: AppTextStyle.cairoSemiBold16white),
               ),


               SizedBox(height: 3,),
               Padding(
                 padding:  EdgeInsets.only(

                   right: 25.w,
                   // bottom: 10.h,
                   // top: 510.h,
                 ),
                 child: Text(
                     "01206673306",
                     style: AppTextStyle.cairoSemiBold16white),
               ),
               SizedBox(height: 50,),
               PinComponent(pinController: pinController),
               BlocBuilder<OtpCubit, OtpState>(
                 builder: (context, state) {
                   return Flexible(
                     child: Padding(
                       padding: const EdgeInsets.all(25),
                       child: ElevatedButton(
                           child: Text(
                             "تاكيد", style: AppTextStyle.cairoSemiBold16white,),
                           style: ElevatedButton.styleFrom(
                             minimumSize: Size(332, 46),
                             backgroundColor: AppColors.darkRed,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10))),
                           ), onPressed: () async {
                         if (_key.currentState!.validate()) {
                           await OtpCubit.get(context).verifyOtp(otp: pinController.text);
                           String? token =
                           CacheHelper.getData(key: 'access_token');
                           if (kDebugMode) {
                             print('UserTOOK $token');
                           }
                         }
                       }
                       ),
                     ),
                   );
                 },
               )


             ],
           )









          ],),
        ),
      ),
    );
  }
}
