import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_cubit.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerCarousel extends StatefulWidget {
  final bool isHome;

  const BannerCarousel({super.key, this.isHome = false});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {


  final List<String> imgList = [
    Assets.imagesEmpty,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        final BannerCubit bannerCubit = BannerCubit.get(context);

        final  banners = bannerCubit.banners;
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
                        height: 450.h,
                        onPageChanged: (index, _) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3)),
                    items: banners.isNotEmpty?banners.map((imgUrl) {
                      return SizedBox(
                          width: double.infinity,
                          child:  CustomImageView(
                            url:banners[currentIndex].photo,
                            fit: BoxFit.fill,
                          )
                          );
                    }).toList():[CustomImageView(imagePath: Assets.imagesEmpty,fit: BoxFit.fill,width: double.infinity,)],
                  ),
                  Align(
                    alignment: widget.isHome ? Alignment.topLeft : Alignment
                        .bottomCenter,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 24.w),
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: banners.length,
                        effect: ExpandingDotsEffect(
                            dotColor: AppColors.grey,
                            activeDotColor: AppColors.black),
                      ),
                    ),
                  ),
                  (widget.isHome ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150.h,
                      decoration: BoxDecoration(gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppColors.red2, AppColors.transparent],
                      )),),
                  ) : const SizedBox())
                ],
              ),
            ));
      },
    );
  }
}
