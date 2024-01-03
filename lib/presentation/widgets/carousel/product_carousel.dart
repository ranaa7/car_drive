import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({
    super.key,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final List<String> imgList = [
    Assets.imagesEmpty,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);
        final productList = productCubit.detailsOfProducts;
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
                        height: 470.h,
                        onPageChanged: (index, _) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3)),
                    items: state is GetProductDetailsLoadingState||productList[0].photos!.isEmpty
                        ? [
                      CustomImageView(
                        imagePath: Assets.imagesEmpty,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      )
                    ]
                        : productList[0].photos!.map((imgUrl) {
                      return InkWell(
                        onTap: () {
                          openPhotoDialog(
                              context, productList[0].photos?[currentIndex].path);
                        },
                        child: SizedBox(
                            width: double.infinity,
                            child: CustomImageView(
                              url: productList[0].photos?[currentIndex].path,
                              fit: BoxFit.fill,
                            )),
                      );
                    }).toList(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 25.0.h, horizontal: 20.w),
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: state is GetProductDetailsLoadingState?0:productList[0].photos!.length,
                        effect: const ExpandingDotsEffect(
                            dotColor: AppColors.grey,
                            activeDotColor: AppColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

openPhotoDialog(BuildContext context, path) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: SizedBox(
            height: 454.h,
              child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage(
                            Assets.imagesEmpty,
                          ),
                          fit: BoxFit.fill)),
                  tightMode: true,
                  enableRotation: true,
                  heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
                  imageProvider: Image.network(path,fit: BoxFit.fill,).image,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle
                  ),
                  width: 40.w,
                  height: 40.h,
                  child: IconButton(
                    icon: const Icon(Icons.clear, color: AppColors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
