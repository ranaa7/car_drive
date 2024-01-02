import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/app_textfield.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_state.dart';
import 'package:more_2_drive/presentation/screens/order_screen/payment_summary.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/order/payment_card.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/payment_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedIndex = 0;
  TextEditingController couponController = TextEditingController();
  bool couponApplied = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 60.0.w,vertical: 10.h),
            child: Button1(
                height: 50,
                width: 50,
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.payMobScreen);
                },
                text: AppStrings.continue1,
                color: AppColors.red3),
          ),
          appBar: DefaultAppBar(),
          body: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 200.w,
                  child: AppTextFormField(
                    controller: couponController,
                    hintText: AppStrings.enterCoupon,
                    fixIcon: Padding(
                      padding: EdgeInsets.only(left: 10.0.w),
                      child: Button1(
                          height: 50,
                          width: 100,
                          onPressed: () {
                            if (couponController.text.isNotEmpty) {
                              setState(() {
                                OrderCubit.get(context).applyCoupon(couponController.text);
                                couponApplied = true;
                              });
                            }else if (couponController.text.isEmpty) {
                              Toasters.show(
                                AppStrings.pleaseEnterCoupon,
                              );
                            }
                            else if (OrderCubit.get(context).applyCouponModel?.result == false) {
                              Toasters.show(
                                OrderCubit.get(context).applyCouponModel?.message ?? '',
                                isError: false,
                              );
                            } else if (couponApplied == true) {
                              setState(() {
                                OrderCubit.get(context).removeCoupon();
                                couponApplied = false;
                              });
                            }
                          },
                          text: couponApplied
                              ? AppStrings.remove
                              : AppStrings.applyCoupon,
                          color: AppColors.red3),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: state is GetPaymentMethodLoadingState
                      ? PaymentShimmer()
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => setState(() {
                                  selectedIndex = index;
                                }),
                                child: PaymentContainer(
                                  index: index,
                                  value: selectedIndex == index ? 0 : 1,
                                  selectedIndex: selectedIndex,
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount:
                              OrderCubit.get(context).paymentTypes.length)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.blue),
                child: Row(
                  children: [
                    Text(
                      AppStrings.totalPrice,
                      style: AppTextStyle.cairoBold16White,
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: PaymentSummary(),
                                  ));
                        },
                        child: Text(
                          AppStrings.detailsString,
                          style: AppTextStyle.cairoSemiBold13LineThroughGrey,
                        )),
                    Text(
                      OrderCubit.get(context).cartSummary?.grandTotal ?? '',
                      style: AppTextStyle.cairoBold16White,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
