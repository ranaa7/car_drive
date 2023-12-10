// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final Color colors;
  const ButtonComponent({super.key , required this.text , required this.colors,    });


  @override
  Widget build(BuildContext context) {
    return    ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize:  const Size(332, 46),
        backgroundColor: colors,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () {  },
      child: Text(text , style: AppTextStyle.cairoSemiBold16white ,),
      //onPressed: isLoading ? null : function ,
    );
  }
}
