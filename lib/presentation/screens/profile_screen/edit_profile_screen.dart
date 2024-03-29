import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:more_2_drive/presentation/widgets/button_component/update_profile_button.dart';
import 'package:more_2_drive/presentation/widgets/form_field/profile_form_field.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../../config/style/app_colors.dart';
import '../login/view_models/login_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstName = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => UpdateProfileCubit()..getUserDataByToken(),
  child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldGround,
      ),
      backgroundColor: AppColors.scaffoldGround,
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(left: 0.w, right: 0.w,
                child: const Center(
                    child: CircleAvatar(
                      radius: 50,
                    )),
              ),
            ],
          ),
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
  builder: (context, state) {
    return Positioned(
            left: 0.w,
            right: 0.w,
            bottom: 0.h,
            top: 150.h,
            child: Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
              decoration: BoxDecoration(
                color: AppColors.deepDarkBlue,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(60).r,
                    topRight: const Radius.circular(60)).r,
              ),
              child: (
                  Form(
                key: EditProfileScreen._key,
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
                        name: firstName,
                        validator: ValidationForm.nameValidator,
                        text: UpdateProfileCubit.get(context).loginModel.user?.username ??
                            "",
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
                        text: UpdateProfileCubit.get(context).loginModel.user?.email ??
                            "",
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
                        text: UpdateProfileCubit.get(context).loginModel.user?.mobileNumber ??
                            "",
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
                          UpdateProfileButton(
                            onPressed: () async {
                              if (EditProfileScreen._key.currentState!.validate()) {
                                await UpdateProfileCubit.get(context)
                                    .updateProfile(
                                        name: firstName.text, password: pass.text);
                              }
                            },
                          ),


                    ],
                  ),
                ),
              )),
            ),
          );
  },
),
        ],
      ),
    ),
);
  }
}
