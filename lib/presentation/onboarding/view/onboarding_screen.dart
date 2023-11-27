import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/onboarding/view/widgets/onboarding_list_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
 OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


 int currentIndex = 0;

  PageController? controller;

 @override
 void initState() {
   controller = PageController(initialPage: 4);
   super.initState();
 }

 @override
 void dispose() {
   controller?.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      PageView.builder(
        controller: controller,
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) { return
          Stack(
        children: [
        Container(
          child: Image.asset( contents[index].image,
          height: double.infinity,
          width: 400,
          fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
        ),

          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),

        Padding(
        padding: const EdgeInsets.only(top: 56 , left: 19 , right: 10),
        child: SmoothPageIndicator(
        controller: controller!,
        count:  4,
        axisDirection: Axis.horizontal,
        effect:  SlideEffect(
        spacing:  5,
        radius:  15,
        dotWidth:  90,
        dotHeight:  4,
        paintStyle:  PaintingStyle.stroke,
        strokeWidth:  1,
        dotColor:  Colors.grey,
        activeDotColor:  Colors.white
        ),
        ),
        ),


          Padding(
          padding: const EdgeInsets.only(top: 520, left: 9 , right: 20 , bottom: 60 ),
          child: Container(
          child: Column(
           //mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset( Assets.imagesMore2driveLogo,
              // height: 154,
              // width: 406,
              //fit: BoxFit.fill,
            ),
          SizedBox(height: 10,),

        Text(contents[index].title, style: AppTextStyle.cairoSemiBold24white),
        Text(contents[index].discription, style: AppTextStyle.cairoSemiBold24white),

            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(

                  child: OutlinedButton(onPressed: (){}, child:

                  Text('انشاء حساب' , style: AppTextStyle.cairoSemiBold16white ,),

                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),

                  ),
                ),
               SizedBox(width: 10,),

                ElevatedButton(
                  child: Text('تسجيل دخول' , style: AppTextStyle.cairoSemiBold16white ,),

                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    backgroundColor: AppColors.blueButton,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {},
                ),

                 TextButton(onPressed: (){}, child:Text('تخطي' , style: AppTextStyle.cairoSemiBold16white ,) )
              ],
            ),


          ],
          ),
          ),
          )


          ],
          ); },

      ),);

  }
}
