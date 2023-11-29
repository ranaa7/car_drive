import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/config/validationform.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/button_component.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 336,
              bottom: 0,
              child: Container(
                width: 430,
                height: 596,
                decoration: BoxDecoration(color: AppColors.white),
                child:   Container(),
              )),
          Positioned(
              //left: 100,
              top: -32,
              left: 24,
              height: 291,
              width: 400,
              child: Image.asset(Assets.imagesLoginTire)),
          Positioned(
              top: 80,
              left: 35,
              height: 122,
              width: 318,
              child: Image.asset(Assets.imagesLoginLogo)),
          Positioned(
              top: 184,
              left: 120,
              height: 58,
              width: 147,
              child: Image.asset(Assets.imagesLoginText)),


          Positioned(
            left: 30,
            right: 30,
            bottom: 20,
            top: 259,
            child: Container(
              padding:
                  EdgeInsets.only(left: 34, right: 30, top: 10, bottom: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 10,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child:
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: (Column(
                  children: [

                    SizedBox(height: 12,),
                    // width: 111px
                    // height: 58px
                    // top: 270px
                    // left: 276px

                    Padding(
                       padding: const EdgeInsets.only(right: 0 , left: 130),
                       child: Text("البريد الالكتروني" , style: AppTextStyle.cairoSemiBold16DarkBlue,),
                     ),
                    SizedBox(height: 12,),
                    TextFormField(

                      controller: _email,
                      validator: (value) {
                        if (ValidationForm.emailValidator(value) != null) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                          BorderSide(color: AppColors.orangeBorder ,),

                        ),


                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(right: 0 , left: 130),
                      child: Text("كلمة السر" , style: AppTextStyle.cairoSemiBold16DarkBlue,),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(

                      controller: _email,
                      validator: (value) {
                        if (ValidationForm.emailValidator(value) != null) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                          BorderSide(color: AppColors.orangeBorder ,),

                        ),


                      ),
                    ),
                    SizedBox(height: 15,),

                    ButtonComponent(text: "تسجيل دخول", colors:  AppColors.deepDarkBlue),
                    SizedBox(height: 4,),
                    Row(children: [Expanded(child: Divider()) , Text("خيارات التسجيل") , Expanded(child: Divider())],),
                    SizedBox(height: 4,),
                    ButtonComponent(text: "سجل برقم هاتف", colors:  AppColors.darkRed),
                    SizedBox(height: 4,),

                    ButtonComponent(text: "سجل عن طريق البريد الالكتروني", colors:  AppColors.blueCielButton),
                    SizedBox(height: 4,),

                    ButtonComponent(text: "قم بتسجيل الدخول باستخدام Apple", colors:  AppColors.black),
                    SizedBox(height: 4,),

                    OutlinedButton(onPressed: (){}, child:
                    Text('قم بتسجيل الدخول باستخدام Google' , style: AppTextStyle.cairoSemiBold16black ,),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(332, 46),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10), ),


                        ),
                        side: BorderSide( color: Colors.black),

                      ),

                    ),



                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
