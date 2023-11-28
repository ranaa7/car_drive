import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final List<String> imgList = [
    Assets.imagesSplash,
    Assets.imagesNew,
    Assets.imagesSplash,
    Assets.imagesSplash,
    Assets.imagesSplash,
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 190.h,
      width: double.infinity,
      child:CarouselSlider(
        options: CarouselOptions(
            height: 190.h,
            onPageChanged: (index,_){
              setState(() {
                currentIndex = index;
              });
            },
            enlargeCenterPage: false,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2)
        ),
        items: imgList.map((imgUrl) {
          return SizedBox(
            width: double.infinity,
            child: CustomImageView(imagePath: imgUrl,fit: BoxFit.fill,)
          );
        }
        ).toList(),
      )
    );
  }
}
