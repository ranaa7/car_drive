import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({super.key , required this.text , required this.colors,    });
 String text;
 Color colors;

  @override
  Widget build(BuildContext context) {
    return    ElevatedButton(
      child: Text(text , style: AppTextStyle.cairoSemiBold16white ,),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(332, 46),
        backgroundColor: colors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ), onPressed: () {  },
      //onPressed: isLoading ? null : function ,
    );
  }
}
