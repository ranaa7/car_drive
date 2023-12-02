import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/sliver_appbar.dart';
import 'package:more_2_drive/presentation/widgets/product/product_details.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,
              bool innerBoxIsScrolled) =>
          [ const DefaultSliverAppBar(isHome: false,height: 60,title: "زيت موبيل 5w-40 لتر٤ + فلتر معدني هديه",)],
          body: Container(
            margin: EdgeInsets.only(top: 17.h),
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:Radius.circular(60) ),gradient: LinearGradient(
              begin: Alignment.bottomCenter, end: Alignment.topCenter,
              colors: [Color(0xff1b4e89), Color(0xff0e396b)], )),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 14.h),
              children: const [ProductDetails(productName: "زيت موبيل 5w-40 لتر٤ + فلتر معدني هديه", productPrice: "productPrice", discount: "discount", availableProduct: "availableProduct", pointsString: "pointsString", pointsNumber: "pointsNumber", sellerLogo: "sellerLogo", sellerString: "sellerString", sellerName: "sellerName", detailsString: "detailsString", details: "details", sellerImage: Assets.imagesProduct)],
            ),
          ),
        ));
  }
}
