import 'package:flutter/material.dart';

import '../../../../config/style/app_colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key , required this.text , required this.icon });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      width: 68,
      decoration: BoxDecoration(
        color: AppColors.deepDarkBlue,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(icon , color: Colors.white,),
            SizedBox(height: 3 ,),
            Text(text,style: TextStyle(fontSize: 9 , color: Colors.white),)
          ],),
      ),
    );
  }
}
