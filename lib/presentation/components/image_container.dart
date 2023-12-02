import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final int height;
  final int width;
  const ImageContainer({super.key, required this.image, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImageView(
          imagePath: image,
          fit: BoxFit.cover,
          height: height.h,
          width: width.w,
        ),
      ),
    );
  }
}
