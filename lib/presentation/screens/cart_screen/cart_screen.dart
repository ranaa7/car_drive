import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_cart__product_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_cubit.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_2.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/cart_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cartCubit = CartCubit.get(context);
        final cartList = cartCubit.cartList;
        double totalPriceSum() {
          return cartList
              .where((item) => item.id == item.id)
              .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
        }

        return Scaffold(
          appBar: DefaultAppBar(
            title: AppStrings.cart,
          ),
          body: state is GetCartListLoadingState
              ? CartShimmer()
              : cartList.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.only(top: 20.h, bottom: 150.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          ProductCubit.get(context)
                              .getDetailsOfProduct(cartList[index].productId);
                          Navigator.pushNamed(context, RouteName.productScreen);
                        },
                        child: CartProductContainer(
                          productImage:
                              cartList[index].productThumbnailImage ?? '',
                          name: cartList[index].productName ?? '',
                          price: cartList[index].price ?? 0,
                          currency: cartList[index].currencySymbol ?? '',
                          onPressed: () {
                            cartCubit.deleteProduct(cartList[index].id);
                            cartCubit.getCartCount();
                          },
                          productQuantity: cartList[index].quantity ?? 1,
                          minusPressed: () => cartCubit.minusPressed(index),
                          plusPressed: () => cartCubit.plusPressed(index),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                      itemCount: cartList.length,
                    )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: Assets.imagesEmptyCart,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          AppStrings.emptyNotification,
                          style: AppTextStyle.cairoMedium14Black,
                        ),
                      ],
                    )),
          bottomSheet: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: AppColors.red4),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.totalPrice,
                        style: AppTextStyle.cairoMedium20white,
                      ),
                      const Spacer(),
                      Text(
                        "${totalPriceSum().toStringAsFixed(2)} EGP",
                        style: AppTextStyle.cairoMedium20white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Button2(
                  height: 50,
                  width: 350,
                  onPressed: () {
                    if (cartList.isNotEmpty) {
                      CarCubit.get(context).getUserCars();
                      Navigator.pushNamed(context, RouteName.selectCarScreen);
                    }else{
                      Toasters.show(AppStrings.pleaseAddProductToCart,
                          isError: false);
                    }
                  },
                  onPressed2: () {
                    cartCubit.updateCart();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
