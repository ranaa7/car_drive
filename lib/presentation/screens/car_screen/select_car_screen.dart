import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_cubit.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_state.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/screens/car_screen/add_or_edit_car_screen.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/car_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class SelectCarScreen extends StatefulWidget {
  const SelectCarScreen({
    super.key,
  });

  @override
  State<SelectCarScreen> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCubit, CarState>(
      builder: (context, state) {
        final CarCubit carCubit = CarCubit.get(context);
        final userCars = CarCubit.get(context).userCars;
        return Scaffold(
          appBar: DefaultAppBar(
            title: AppStrings.selectCar,
          ),
          body: state is GetCarBrandsLoadingState
              ? CarShimmer()
              : userCars.isNotEmpty
                  ? Stack(
                      children: [
                        ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 120.h, top: 20.h),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      carCubit.setPickModel(userCars[index]);
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: selectedIndex == index
                                                  ? AppColors.red
                                                  : AppColors.white,
                                              width: 1.w),
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          boxShadow: AppShadows.shadow3),
                                      height: 87.h,
                                      width: 352.w,
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppStrings.carType,
                                                style: AppTextStyle
                                                    .cairoMedium14Grey,
                                              ),
                                              Text(
                                                AppStrings.carModel,
                                                style: AppTextStyle
                                                    .cairoMedium14Grey,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  carCubit.userCars[index]
                                                          .carType ??
                                                      '',
                                                  style: AppTextStyle
                                                      .cairoMedium14Black),
                                              Text(
                                                carCubit.userCars[index]
                                                        .carModel ??
                                                    '',
                                                style: AppTextStyle
                                                    .cairoMedium14Black,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                            itemCount: carCubit.userCars.length),
                        Container(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Button1(
                                    color: AppColors.blue,
                                    height: 43,
                                    width: 200,
                                    onPressed: () {
                                      CarCubit.get(context).getUserCars();
                                      Navigator.pushNamed(context,
                                          RouteName.addOrEditCarScreen);
                                    },
                                    text: AppStrings.addOrEditCar),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Button1(
                                    color: AppColors.red3,
                                    height: 43,
                                    width: 420,
                                    onPressed: () {
                                      CartCubit.get(context).getCartList();
                                      OrderCubit.get(context).getPickupList();
                                      OrderCubit.get(context)
                                          .getUserAddressList();
                                      carCubit.updateUserCar(
                                          carCubit.userCarsModel?.id);
                                      Navigator.pushNamed(context,
                                          RouteName.orderPickUpLocationScreen);
                                    },
                                    text: AppStrings.continueToPickup),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : const AddOrEditCarScreen(),
        );
      },
    );
  }
}
