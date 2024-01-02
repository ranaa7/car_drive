import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/domain/models/order_model/city_by_state_model.dart';
import 'package:more_2_drive/domain/models/order_model/state_by_country_model.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/drop_list/app_drop_list.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_state.dart';
import 'package:more_2_drive/presentation/screens/order_screen/form_field/address.dart';
import 'package:more_2_drive/presentation/screens/order_screen/form_field/phone.dart';
import 'package:more_2_drive/presentation/screens/order_screen/form_field/postal_code.dart';
import 'package:more_2_drive/presentation/screens/order_screen/user_address_container.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class AddOrEditAddressScreen extends StatefulWidget {
  const AddOrEditAddressScreen({super.key});

  @override
  State<AddOrEditAddressScreen> createState() => _AddOrEditAddressScreenState();
}

class _AddOrEditAddressScreenState extends State<AddOrEditAddressScreen> {
  int selectedOption = 0;
  int selectedIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userAddress = OrderCubit.get(context).userAddressList;
    return Scaffold(
      appBar:  DefaultAppBar(
        title: AppStrings.userAddress,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          userAddress.isEmpty
              ? Column(
                  children: [
                    CustomImageView(
                      imagePath: Assets.imagesEmptyAddress,
                      fit: BoxFit.cover,
                      height: 70.h,
                      width: 70.w,
                    )
                  ],
                )
              : ListView.separated(
            padding: EdgeInsets.only(bottom: 80.h),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: UserAddressContainer(
                          address: userAddress[index].address ?? '',
                          city: userAddress[index].cityName ?? '',
                          state: userAddress[index].stateName ?? '',
                          country: userAddress[index].countryName ?? '',
                          postalCode: userAddress[index].postalCode ?? '',
                          phone: userAddress[index].phone ?? '',
                          selectedIndex: selectedIndex,
                          index: index,
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: userAddress.length),
          Padding(
            padding:  EdgeInsets.only(bottom:20.h),
            child: Button1(
                height: 60,
                width: 235,
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          contentPadding: EdgeInsets.only(
                              top: 36.0.h,
                              left: 36.0.w,
                              right: 36.0.w,
                              bottom: 36.0.h),
                          content: SingleChildScrollView(
                            child: BlocBuilder<OrderCubit, OrderState>(
                              builder: (context, state) {
                                final OrderCubit orderCubit =
                                    OrderCubit.get(context);
                                final List<StateByCountryModel> stateByCountry =
                                    orderCubit.stateByCountries;
                                final List<CityByStateModel> cityByState =
                                    orderCubit.cityByStates;
                                return SizedBox(
                                  width: 400.w,
                                  child: Form(
                                    key: formKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AddressForm(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          AppStrings.state,
                                          style: AppTextStyle.cairoSemiBold15Grey,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        AppDropList<StateByCountryModel>(
                                          items: stateByCountry,
                                          compareFn: (stateByCountry, filter) =>
                                              stateByCountry.id == filter.id,
                                          filterFn: (stateByCountry, filter) =>
                                              stateByCountry.name!
                                                  .toLowerCase()
                                                  .contains(filter.toLowerCase()),
                                          asyncItems: (String filter) async {
                                            await orderCubit.getStateByCountry();
                                            return orderCubit.stateByCountries;
                                          },
                                          itemsAsString: (stateByCountry) =>
                                              stateByCountry.name ?? '',
                                          itemBuilder: (context, t, isSelected) =>
                                              Container(
                                            padding: const EdgeInsets.all(8),
                                            color: isSelected
                                                ? AppColors.red3
                                                : AppColors.white,
                                            child: Center(
                                              child: Text(
                                                t.name ?? '',
                                                style: AppTextStyle
                                                    .cairoMedium14Black
                                                    .copyWith(
                                                  color: isSelected
                                                      ? AppColors.white
                                                      : AppColors.red3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChange: orderCubit.onSelectState,
                                          hintText: AppStrings.enterState,
                                        ),
                                        Text(
                                          AppStrings.city,
                                          style: AppTextStyle.cairoSemiBold15Grey,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        AppDropList<CityByStateModel>(
                                          items: cityByState,
                                          itemsAsString: (cityByState) =>
                                              cityByState.name ?? '',
                                          compareFn: (cityByState, filter) =>
                                              cityByState.id == filter.id,
                                          filterFn: (cityByState, filter) =>
                                              cityByState.name!
                                                  .toLowerCase()
                                                  .contains(filter.toLowerCase()),
                                          itemBuilder: (context, cityByState,
                                                  isSelected) =>
                                              Container(
                                            padding: const EdgeInsets.all(8),
                                            color: isSelected
                                                ? AppColors.red3
                                                : AppColors.white,
                                            child: Center(
                                              child: Text(
                                                cityByState.name ?? '',
                                                style: AppTextStyle
                                                    .cairoMedium14Black
                                                    .copyWith(
                                                  color: isSelected
                                                      ? AppColors.white
                                                      : AppColors.red3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChange:
                                              orderCubit.onSelectCityByState,
                                          hintText: AppStrings.enterCity,
                                          emptyText: AppStrings.selectStateFirst,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        PostalCodeForm(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        PhoneForm(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Button1(
                                              color: AppColors.red3,
                                              height: 36,
                                              width: 120,
                                              onPressed: () {},
                                              text: AppStrings.add,
                                            ),
                                            const Spacer(),
                                            Button1(
                                              color: AppColors.grey4,
                                              height: 36,
                                              width: 120,
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              text: AppStrings.close,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ),
                text: AppStrings.addLocation,
                color: AppColors.blue),
          )
        ],
      ),
    );
  }
}
