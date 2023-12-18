import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/strings/app_strings.dart';

class loginProfileColumn extends StatelessWidget {
  const loginProfileColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesLockLogo),
        SizedBox(height: 20,),
        Text(AppStrings.signIn , style: TextStyle(fontSize:32 , color: Colors.white ),),

        Text(AppStrings.activate , style: TextStyle(fontSize:32 , color: Colors.white ),),
        SizedBox(height: 90,),
        Divider(thickness: 0, color: Colors.white,),
        Row(


          children: [
            Expanded(child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.watch_later_outlined, color: Colors.white,))),
            Text(AppStrings.date, style: TextStyle(fontSize:20 , color: Colors.grey ),),


          ],
        ),
        Divider(thickness: 0, color: Colors.white,),
        Row(

          children: [
            Expanded(child: Align(
                alignment:Alignment.topLeft,
                child: Icon(Icons.construction, color: Colors.white,))),
            Text(AppStrings.point, style: TextStyle(fontSize:20 , color: Colors.grey ),),


          ],
        ),
        SizedBox(height: 10,),
        Divider(thickness: 0, color: Colors.white,),
        Row(


          children: [
            Expanded(child: Align(
              alignment: Alignment.topLeft,
              child:FaIcon(FontAwesomeIcons.coins , color: Colors.white,),)),
            Text(AppStrings.services, style: TextStyle(fontSize:20 , color: Colors.grey ),),


          ],
        ),
        Divider(thickness: 0, color: Colors.white,),
      ],
    );
  }
}
