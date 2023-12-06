import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_2_drive/presentation/login/view/login_screen.dart';

import '../core/network/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(
         child: TextButton(onPressed: (){
           CacheHelper.removeData(key: 'access-token').then((value) {
             if (value) {
               Get.offAll(() =>LoginScreen());
             }
           });
         }, child: Text("Logout")),
       ),
    );
  }
}
