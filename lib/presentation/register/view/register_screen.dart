import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/otp/view/otp_screen.dart';
import 'package:more_2_drive/presentation/register/view/widgets/image_component.dart';
import 'package:more_2_drive/presentation/register/view/widgets/privacy_row_component.dart';
import 'package:more_2_drive/presentation/register/view_models/phone_register_cubit.dart';
import 'package:more_2_drive/presentation/widgets/form_field/first_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/last_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/phonenum_textfield.dart';

import '../../../core/app_constants/constants.dart';
import '../../../core/functions/show_toast.dart';
import '../../../core/network/local/cache_helper.dart';

class RegisterScreen extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();

RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fname = TextEditingController();

  final sname = TextEditingController();

  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneRegisterCubit, PhoneRegisterState>(
  listener: (context, state) async{
    if (state is PhoneRegisterSuccessState) {
      if (kDebugMode) {
        print('TOOKKEEN ${state.phoneLoginModel.token}');
      }
      showToast(
          message: state.phoneLoginModel.message ?? 'check your SMS',
          bcColor: Colors.green);
      userId = state.phoneLoginModel.id.toString();
      await CacheHelper.saveDate(key: 'user_id', value: userId);
      token = state.phoneLoginModel.token!;

      CacheHelper.saveDate(key: 'access_token', value: state.phoneLoginModel.token)
          .then((value) => {Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(id: state.phoneLoginModel.id,)))});
    } else if (state is PhoneRegisterFailureState) {
      showToast(message: state.errMessage, bcColor: Colors.red);
    }
  },
  child: DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: const Column(
                    children: [],
                  ),
                )),
            const ImageComponent(),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 370.h,
              top: 259.h,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 34, right: 30, top: 10, bottom: 10).r,
                decoration:  BoxDecoration(
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
                  child: Form(
                    key: RegisterScreen._formKey,
                    child: (Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),

                       // PhoneFormfield(phone: phone,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PhoneNumberFormField(phone: phone),
                            const CountryCodePicker(initialSelection: "EG", showCountryOnly: true,)
                          ],
                        ),
                        const PrivacyRoComponent(),



                         SizedBox(height: 12.h,),


                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(332, 46),
                        backgroundColor: AppColors.darkRed,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ), onPressed: () async{
                      if (RegisterScreen._formKey.currentState!.validate()) {
                        await PhoneRegisterCubit.get(context).phoneLogin( phone: phone.text);

                        String? token =
                        CacheHelper.getData(key: 'access_token');
                        if (kDebugMode) {
                          print('UserTOOK $token');
                        }


                      }
                    },
                      child: Text("انشاء حساب" , style: AppTextStyle.cairoSemiBold16white ,),

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
