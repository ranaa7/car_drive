import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerCarousel extends StatefulWidget {
  final bool isHome;
  const BannerCarousel({super.key,  this.isHome=false});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final List<String> imgList = [
    Assets.imagesProduct,
    Assets.imagesBanner,
    Assets.imagesBanner,
    Assets.imagesBanner,
    Assets.imagesBanner,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            ),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 410.h,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2)),
                items: imgList.map((imgUrl) {
                  return SizedBox(
                      width: double.infinity,
                      child: CustomImageView(
                        imagePath: imgUrl,
                        fit: BoxFit.fill,
                      ));
                }).toList(),
              ),
              Align(
                alignment: widget.isHome?Alignment.topLeft:Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 24.w),
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: imgList.length,
                    effect: ExpandingDotsEffect(
                        dotColor: AppColors.grey,
                        activeDotColor: AppColors.black),
                  ),
                ),
              ),
              (widget.isHome?Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200.h,
                  decoration:  BoxDecoration( gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.red2, AppColors.transparent],
                  )),),
              ):const SizedBox())
            ],
          ),
        ));
  }
}
