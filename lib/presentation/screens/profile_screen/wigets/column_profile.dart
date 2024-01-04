import 'package:flutter/material.dart';

import '../../../../config/style/app_colors.dart';

class ProfileColumn extends StatelessWidget {
 final String name;
 final String num;
 final double left;
  const ProfileColumn({super.key , required this.name , required this.num , required this.left});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: left),
          child: Text(num.toString(), style: TextStyle(fontSize: 32 , color: AppColors.deepDarkBlue), ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: left),
          child: Text(name , style: TextStyle(fontSize: 16 , color: AppColors.darkRed), ),
        ),
      ],
    );
  }
}
