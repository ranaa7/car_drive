import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/domain/models/car_model/car_brands_model.dart';
import 'package:more_2_drive/domain/models/car_model/car_brands_models_model.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_cubit.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_state.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/drop_list/car_drop_list.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class AddOrEditCarScreen extends StatelessWidget {
  const AddOrEditCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  DefaultAppBar(title: AppStrings.addOrEditCar,),
      body: Center(
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: SingleChildScrollView(
                  child: BlocBuilder<CarCubit, CarState>(
                    builder: (context, state) {
                      final CarCubit carCubit = CarCubit.get(context);
                      final List<CarBrandModel> carBrands = carCubit.carBrands;
                      final List<CarBrandsModelsModel> carBrandsModels =
                          carCubit.carBrandsModels;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CarDropList<CarBrandModel>(
                            items: carBrands,
                            compareFn: (carBrands, filter) =>
                            carBrands.id == filter.id,
                            filterFn: (carBrands, filter) => carBrands.types!
                                .toLowerCase()
                                .contains(filter.toLowerCase()),
                            asyncItems: (String filter) async {
                              await carCubit.getCarBrands();
                              return carCubit.carBrands;
                            },
                            itemsAsString: (carBrands) => carBrands.types ?? '',
                            itemBuilder: (context, t, isSelected) => Container(
                              padding: const EdgeInsets.all(8),
                              color:
                              isSelected ? AppColors.red3 : AppColors.white,
                              child: Center(
                                child: Text(
                                  t.types ?? '',
                                  style:
                                  AppTextStyle.cairoMedium14Black.copyWith(
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.red3,
                                  ),
                                ),
                              ),
                            ),
                            onChange: carCubit.onSelectCar,
                            hintText: 'Select Car Brand',
                          ),
                          CarDropList<CarBrandsModelsModel>(
                            items: carBrandsModels,
                            itemsAsString: (carBrands) =>
                            carBrands.carModel ?? '',
                            compareFn: (carBrands, filter) =>
                            carBrands.id == filter.id,
                            filterFn: (carBrands, filter) => carBrands.carModel!
                                .toLowerCase()
                                .contains(filter.toLowerCase()),
                            itemBuilder: (context, carBrandModel, isSelected) =>
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  color:
                                  isSelected ? AppColors.red3 : AppColors.white,
                                  child: Center(
                                    child: Text(
                                      carBrandModel.carModel ?? '',
                                      style:
                                      AppTextStyle.cairoMedium14Black.copyWith(
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.red3,
                                      ),
                                    ),
                                  ),
                                ),
                            onChange: carCubit.onSelectCarBrandsModelsModel,
                            hintText: 'Select Car Brand Model',
                            emptyText: AppStrings.selectCarBrandFirst,
                          ),
                          CarDropList<int>(
                            items: [
                              for (var i = DateTime.now().year;
                              i > 1960;
                              i -= 1)
                                i
                            ],
                            itemsAsString: (year) => year.toString(),
                            compareFn: (year, filter) => year == filter,
                            itemBuilder: (context, year, isSelected) =>
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  color:
                                  isSelected ? AppColors.red3 : AppColors.white,
                                  child: Center(
                                    child: Text(
                                      year.toString(),
                                      style:
                                      AppTextStyle.cairoMedium14Black.copyWith(
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.red3,
                                      ),
                                    ),
                                  ),
                                ),
                            hintText: 'Select Year',
                          ),
                          Row(
                            children: [
                              Button1(
                                color: AppColors.red3,
                                height: 36,
                                width: 120,
                                onPressed: () {
                                  carCubit.addCar(carCubit.carBrandModel?.id,
                                      carCubit.carBrandsModelsModel?.id);
                                  Navigator.pop(context);
                                  carCubit.getUserCars();
                                },
                                text: AppStrings.add,
                              ),
                              Button1(
                                color: AppColors.grey4,
                                height: 36,
                                width: 120,
                                onPressed: () => Navigator.pop(context),
                                text: AppStrings.close,
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                )),
          ),
          child: SizedBox(
            height: 180.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  fit: BoxFit.contain,
                  imagePath: Assets.imagesAddCar,
                  height: 120.h,
                  width: 120.w,
                ),
                Text(
                  AppStrings.addOrEditCar,
                  style: AppTextStyle.cairoMedium22red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
