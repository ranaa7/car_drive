import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/screens/signup/view_models/signup_cubit.dart';
import 'package:more_2_drive/presentation/screens/signup/views/widgets/phonetextfiled.dart';
import 'package:more_2_drive/presentation/widgets/form_field/email_formfield.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';


import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../core/app_constants/constants.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../register/view/widgets/image_component.dart';
import '../../../widgets/form_field/first_name_formfield.dart';
import '../../../widgets/form_field/last_name_formfield.dart';
import '../../../widgets/form_field/password_formfield.dart';
 bool isLogin = false;
class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final secName = TextEditingController();
  final phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
     return
       BlocListener<SignupCubit, SignupState>(
      listener: (context, state) async{
        if (state is SignupSuccessState) {
          if (kDebugMode) {
            print('TOOKKEEN ${state.signupModel.token}');
          }
          showToast(
              message: state.signupModel.message?? 'Registered successfully',
              bcColor: Colors.green);
          token = state.signupModel.token!;
          userId = state.signupModel.id.toString();
          await CacheHelper.saveDate(key: 'user_id', value: userId);

          CacheHelper.saveDate(key: 'access_token', value: state.signupModel.token)
              .then((value) => {Navigator.pushNamed(context, RouteName.mainScreen)});
        } else if (state is SignupFailureState) {
          showToast(message: state.errMessage, bcColor: Colors.red);
        }
      },
   child: DefaultTabController(
        length: 4,
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
                    child: const Column(
                      children: [],
                    ),
                  )),
              const ImageComponent(),
              Positioned(
                left: 20.w,
                right: 20.w,
                bottom: 90.h,
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
                      key: _formKey,
                      child: (Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding:const EdgeInsets.only(right: 0, left: 130).r,
                            child: Text(
                              "الاسم الاول",
                              style: AppTextStyle.cairoSemiBold16DarkBlue,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          FirstNameFormfield(fname: firstName,),
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
                          LastNameFormfield(lname: secName,),
                          SizedBox(
                            height: 15.h,
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
                          EmailFormField(email: email),
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, left: 130).r,
                            child: Text(
                              "كلمة السر",
                              style: AppTextStyle.cairoSemiBold16DarkBlue,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          PasswordFormField(password: password),

                          SizedBox(
                            height: 30.h,
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
                          PhoneFormField(phone: phone),

                          SizedBox(
                            height: 30.h,
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(332, 46),
                              backgroundColor: AppColors.darkRed,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ), onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              isLogin=true;
                              await SignupCubit.get(context).signUp(firstName: firstName.text, secName: secName.text, email: email.text, password: password.text, phone: phone.text);

                              String? token =
                              CacheHelper.getData(key: 'access_token');
                              if (kDebugMode) {
                                print('UserTOOK $token');
                              }

                            }},

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
      ),);

  }
}