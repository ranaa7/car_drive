import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class PrivacyRoComponent extends StatelessWidget {
  const PrivacyRoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_box,
              color: AppColors.darkRed,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "أوافق على ",
                style: AppTextStyle.cairoSemiBold12DarkBlue,
              ),
              TextSpan(
                text: "الشروط والأحكام و سياسة الخصوصية",
                style: AppTextStyle.cairoSemiBold12DarkRed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
