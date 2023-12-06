import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/otp/view/otp_screen.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/register/view/widgets/privacy_row_component.dart';
import 'package:more_2_drive/presentation/register/view_models/phone_register_cubit.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';
import 'package:more_2_drive/presentation/widgets/form_field/first_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/last_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/phone_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/phonenum_textfield.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/functions/show_toast.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

 static final _formKey = GlobalKey<FormState>();

  var fname = TextEditingController();
  var sname = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneRegisterCubit, PhoneRegisterState>(
  listener: (context, state) {
    if (state is PhoneRegisterSuccessState) {
      if (kDebugMode) {
        print('TOOKKEEN ${state.phoneLoginModel.token}');
      }
      showToast(
          message: state.phoneLoginModel.message ?? 'check your SMS',
          bcColor: Colors.green);
      token = state.phoneLoginModel.token!;

      CacheHelper.saveDate(key: 'access_token', value: state.phoneLoginModel.token)
          .then((value) => {Get.to(() =>  OtpScreen())});
    } else if (state is PhoneRegisterFailureState) {
      showToast(message: state.errMessage, bcColor: Colors.red);
    }
  },
  child: DefaultTabController(
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
                  child: Form(
                    key: _formKey,
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
                        FirstNameFormfield(fname: fname,),
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
                        LastNameFormfield(lname: sname,),
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
                       // PhoneFormfield(phone: phone,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            phoneNumFormfield(phone: phone),
                            CountryCodePicker(initialSelection: "EG", showCountryOnly: true,)
                          ],
                        ),
                        PrivacyRoComponent(),



                         SizedBox(height: 12.h,),


                    ElevatedButton(
                      child: Text("انشاء حساب" , style: AppTextStyle.cairoSemiBold16white ,),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(332, 46),
                        backgroundColor: AppColors.darkRed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ), onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        await PhoneRegisterCubit.get(context).phoneLogin(fname: fname.text, secname: sname.text, phone: phone.text);

                        String? token =
                        CacheHelper.getData(key: 'access_token');
                        if (kDebugMode) {
                          print('UserTOOK $token');
                        }


                      }
                    },

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
    ),
);
  }
}
