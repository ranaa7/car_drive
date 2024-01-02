import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:more_2_drive/presentation/widgets/button_component/delete_button.dart';
import 'package:more_2_drive/presentation/widgets/button_component/update_profile_button.dart';
import 'package:more_2_drive/presentation/widgets/form_field/first_name_formfield.dart';
import 'package:more_2_drive/presentation/widgets/form_field/profile_form_field.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../../config/style/app_colors.dart';
import '../login/view_models/login_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  var fname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Scaffoldfground,
      ),
      backgroundColor: AppColors.Scaffoldfground,
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(left: 0, right: 0,
                child: Center(
                    child: CircleAvatar(
                      radius: 50,
                    )),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 150,
            //di bntl3 el container el abyd l fo2
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              decoration: BoxDecoration(
                color: AppColors.deepDarkBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: (
                  Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      Padding(
                        padding: context.isRTL
                            ? EdgeInsets.only(right: 15.w)
                            : EdgeInsets.only(left: 15.w),
                        child: Text(
                          AppStrings.name,
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ProfileFormField(
                        name: fname,
                        validator: ValidationForm.nameValidator,
                        text: '',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: context.isRTL
                            ? EdgeInsets.only(right: 15.w)
                            : EdgeInsets.only(left: 15.w),
                        child: Text(
                          AppStrings.email,
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ProfileFormField(
                        name: email,
                        text: '',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: context.isRTL
                            ? EdgeInsets.only(right: 15.w)
                            : EdgeInsets.only(left: 15.w),
                        child: Text(
                          AppStrings.phone,
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ProfileFormField(
                        name: phone,
                        text: '',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: context.isRTL
                            ? EdgeInsets.only(right: 15.w)
                            : EdgeInsets.only(left: 15.w),
                        child: Text(
                          AppStrings.password,
                          style: AppTextStyle.cairoSemiBold16white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ProfileFormField(
                        name: pass,
                        validator: ValidationForm.passwordValidator,
                        text: '',
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                        builder: (context, state) {
                          return UpdateProfileButton(
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                await UpdateProfileCubit.get(context)
                                    .updateProfile(
                                        name: fname.text, password: pass.text);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return DeleteButton(
                            onPressed: () async {
                              await LoginCubit.get(context).userDeleteAcc();
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
