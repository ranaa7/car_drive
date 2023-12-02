import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/presentation/widgets/setting_widgets/setting_radio_button.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int selectedValue =
    context.supportedLocales.map<String>((e) => e.languageCode).toList().indexOf(context.languageCode);
    return  Scaffold(
      body: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width, 100.0)),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          children: [
            SettingRadioButton(
              value: 0,
              text: AppStrings.english,
              selectedValue: selectedValue,
              onChanged: (v) {
                context.setLocale(context.supportedLocales[v??0]);
              },
            ),
            SettingRadioButton(
              value: 1,
              text: AppStrings.arabic,
              selectedValue: selectedValue,
              onChanged: (v) {
                context.setLocale(context.supportedLocales[v??0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
