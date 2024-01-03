// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

class ProfileFormField extends StatelessWidget {
  ProfileFormField({super.key , required this.name ,  this.validator , required this.text});
  var name = TextEditingController();
  String? Function(String?)? validator;
  String text;
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
         // alignment: Alignment.center,
          width: 370,
        child:
        TextFormField(

          controller: name,
          validator: validator,

          decoration: InputDecoration(
            hintText: text,
            fillColor: AppColors.white,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none, // No border to overlap with the shadow
            ),
          ),
        ),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey,
        //       blurRadius: 25,
        //       offset: const Offset(0, 10),
        //     ),
        //   ],
        // ),
            ),
      );



  }
}
