import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_cart__product_container.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_state.dart';
import 'package:more_2_drive/presentation/screens/order_screen/pickup_container.dart';
import 'package:more_2_drive/presentation/screens/order_screen/user_address_container.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/setting_widgets/setting_radio_button.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/pickup_locations_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class OrderPickUpLocationScreen extends StatefulWidget {
  const OrderPickUpLocationScreen({super.key});

  @override
  State<OrderPickUpLocationScreen> createState() =>
      _OrderPickUpLocationScreenState();
}

class _OrderPickUpLocationScreenState extends State<OrderPickUpLocationScreen> {
  int selectedOption = 0;
  int selectedIndex = 0;
  int selectedPickupId = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartList = CartCubit.get(context).cartList;
        final pickupList = OrderCubit.get(context).pickupList;
        final userAddressList = OrderCubit.get(context).userAddressList;
        return Scaffold(
          bottomNavigationBar: Button1(
              color: AppColors.red3,
              height: 43,
              width: 420,
              onPressed: () {
                OrderCubit.get(context).updateShippingTypeInCart(
                    selectedIndex == 0
                        ? OrderCubit.get(context).pickupModel?.id
                        : OrderCubit.get(context).userAddress?.id,
                    selectedIndex == 0 ? "pickup_point" : "home_delivery");
                Navigator.pushNamed(context, RouteName.orderPickUpTimeScreen);
              },
              text: AppStrings.continue1),
          appBar: DefaultAppBar(
            title: AppStrings.selectCar,
          ),
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.only(bottom: 100.h, top: 20.h),
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CartProductContainer(
                        isPickup: true,
                          productImage:
                              cartList[index].productThumbnailImage ?? '',
                          name: cartList[index].productName ?? '',
                          price: cartList[index].price,
                          currency: cartList[index].currencySymbol ?? '',
                          onPressed: () {}),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: cartList.length),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.choosePickup,
                          style: AppTextStyle.cairoSemiBold17Black,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 149.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.red3),
                              child: FittedBox(
                                  child: SizedBox(
                                child: SettingRadioButton(
                                  selectedValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                  value: 0,
                                  text: AppStrings.pickupOrServices,
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 149.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: AppColors.red),
                                  color: AppColors.red4),
                              child: FittedBox(
                                  child: SettingRadioButton(
                                selectedValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                                value: 1,
                                text: AppStrings.homeDelivery,
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        selectedOption == 0
                            ? state is GetPickupPointLoadingState
                                ? PickUpLocationShimmer()
                                : ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                              OrderCubit.get(context)
                                                  .setPickModel(
                                                      pickupList[index]);
                                              print(OrderCubit.get(context)
                                                  .pickupModel
                                                  ?.id
                                                  .toString());
                                            });
                                          },
                                          child: PickUpContainer(
                                            pickupName:
                                                pickupList[index].name ?? '',
                                            pickupLocation:
                                                pickupList[index].address ?? '',
                                            selectedIndex: selectedIndex,
                                            index: index,
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                    itemCount: pickupList.length)
                            : Column(
                                children: [
                                  ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                                OrderCubit.get(context)
                                                    .setUserAddress(
                                                        userAddressList[index]);
                                                print(OrderCubit.get(context)
                                                    .userAddress
                                                    ?.id
                                                    .toString());
                                              });
                                            },
                                            child: UserAddressContainer(
                                              address: userAddressList[index]
                                                      .address ??
                                                  '',
                                              city: userAddressList[index]
                                                      .cityName ??
                                                  '',
                                              state: userAddressList[index]
                                                      .stateName ??
                                                  '',
                                              country: userAddressList[index]
                                                      .countryName ??
                                                  '',
                                              postalCode: userAddressList[index]
                                                      .postalCode ??
                                                  '',
                                              phone: userAddressList[index]
                                                      .phone ??
                                                  '',
                                              selectedIndex: selectedIndex,
                                              index: index,
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                      itemCount: userAddressList.length),
                                  TextButton(
                                    onPressed: () {
                                      OrderCubit.get(context)
                                          .getUserAddressList();
                                      Navigator.pushNamed(context,
                                          RouteName.addOrEditAddressScreen);
                                    },
                                    child: Text(
                                      AppStrings.addOrEditAddress,
                                      style: AppTextStyle.cairoSemiBold15Red,
                                    ),
                                  )
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
