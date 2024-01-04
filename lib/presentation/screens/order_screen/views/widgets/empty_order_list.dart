import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class EmptyOrdersView extends StatelessWidget {
  const EmptyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noorders,
        style: AppTextStyle.cairoSemiBold23black,
      ),
    );
  }
}
