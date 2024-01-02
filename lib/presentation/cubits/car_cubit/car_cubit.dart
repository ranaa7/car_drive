import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/car_model/car_brands_model.dart';
import 'package:more_2_drive/domain/models/car_model/car_brands_models_model.dart';
import 'package:more_2_drive/domain/models/car_model/user_cars_model.dart';
import 'package:more_2_drive/domain/repositories/car_repo/car_repo.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_state.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepo _carRepo;

  CarCubit(this._carRepo) : super(InitState());

  static CarCubit get(context, {bool listen = false}) =>
      BlocProvider.of<CarCubit>(context, listen: listen);
  List<CarBrandModel> carBrands = [];
  List<CarBrandsModelsModel> carBrandsModels = [];
  List<UserCarsModel> userCars = [];
  UserCarsModel? _userCarsModel;

  UserCarsModel? get userCarsModel => _userCarsModel;
  setPickModel(UserCarsModel? userCarsModel) {
    _userCarsModel = userCarsModel;
  }
  CarBrandModel? _carBrandModel;

  CarBrandModel? get carBrandModel => _carBrandModel;
  CarBrandsModelsModel? _carBrandsModelsModel;

  CarBrandsModelsModel? get carBrandsModelsModel => _carBrandsModelsModel;

  onSelectCar(CarBrandModel? carBrandModel) async {
    _carBrandModel = carBrandModel;
    _carBrandsModelsModel = null;

    emit(GetCarBrandsLoadingState());
    if (_carBrandModel != null) {
      await getCarBrandsModels(_carBrandModel?.id);
    }
  }

  onSelectCarBrandsModelsModel(CarBrandsModelsModel? carBrandModel) {
    _carBrandsModelsModel = carBrandModel;

    emit(GetCarBrandsLoadingState());
  }

  getCarBrands() async {
    emit(GetCarBrandsLoadingState());
    final result = await _carRepo.getCarBrands();
    result.fold((l) {
      final getCarBrands = l.data["data"];
      if (getCarBrands != null) {
        carBrands = getCarBrands
            .map<CarBrandModel>((e) => CarBrandModel.fromJson(e))
            .toList();
      }
      emit(GetCarBrandsSuccessState());
    }, (r) => emit(GetCarBrandsErrorState()));
  }

  getUserCars() async {
    emit(GetCarBrandsLoadingState());
    final result = await _carRepo.getUserCars();
    result.fold((l) {
      final getUserCar = l.data["data"];
      if (getUserCar != null) {
        userCars = getUserCar
            .map<UserCarsModel>((e) => UserCarsModel.fromJson(e))
            .toList();
      }
      emit(GetCarBrandsSuccessState());
    }, (r) => emit(GetCarBrandsErrorState()));
  }

  getCarBrandsModels(int carId) async {
    print(carId);
    emit(GetCarBrandsLoadingState());
    final result = await _carRepo.getCarBrandsModel(carId);
    result.fold((l) {
      final getCarBrandsModels = l.data["data"];
      if (getCarBrandsModels != null||_carBrandModel!=null) {
        carBrandsModels = getCarBrandsModels
            .map<CarBrandsModelsModel>((e) => CarBrandsModelsModel.fromJson(e))
            .toList();
      }
      emit(GetCarBrandsSuccessState());
    }, (r) => emit(GetCarBrandsErrorState()));
  }
  updateUserCar(int? carId) async {
    print(carId);
    emit(GetCarBrandsLoadingState());
    final result = await _carRepo.updateUserCar(carId);
    result.fold((l) {
      // final getUserCar = l.data["data"];
      // if (getUserCar != null) {
      //   userCars = getUserCar
      //       .map<UserCarsModel>((e) => UserCarsModel.fromJson(e))
      //       .toList();
      // }
      emit(GetCarBrandsSuccessState());
    }, (r) => emit(GetCarBrandsErrorState()));
  }

  addCar(int carType, int carModel) async {
    emit(GetCarBrandsLoadingState());
    final result = await _carRepo.addCar(carType, carModel);
    result.fold((l) {
      final getCarBrandsModels = l.data["data"];
      if (getCarBrandsModels != null) {
        carBrandsModels = getCarBrandsModels
            .map<CarBrandsModelsModel>((e) => CarBrandsModelsModel.fromJson(e))
            .toList();
      }
      getUserCars();
      _carBrandModel = null;
      _carBrandsModelsModel = null;
      emit(GetCarBrandsSuccessState());
    }, (r) => emit(GetCarBrandsErrorState()));
  }
}
