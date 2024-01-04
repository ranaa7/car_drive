import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/cart_model/cart_list_model.dart';
import 'package:more_2_drive/domain/models/order_model/address_model.dart';
import 'package:more_2_drive/domain/models/order_model/apply_coupon_model.dart';
import 'package:more_2_drive/domain/models/order_model/cart_summary_model.dart';
import 'package:more_2_drive/domain/models/order_model/city_by_state_model.dart';
import 'package:more_2_drive/domain/models/order_model/payment_types_model.dart';
import 'package:more_2_drive/domain/models/order_model/pickup_model.dart';
import 'package:more_2_drive/domain/models/order_model/state_by_country_model.dart';
import 'package:more_2_drive/domain/repositories/order_repo/order_repo.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _orderRepo;

  OrderCubit(this._orderRepo) : super(InitState());

  static OrderCubit get(context, {bool listen = false}) =>
      BlocProvider.of<OrderCubit>(context, listen: listen);
  List<PickupModel> pickupList = [];
  List<CartSummaryModel> cartListSummary = [];
  PickupModel? _pickupModel;

  PickupModel? get pickupModel => _pickupModel;
  AddressModel? _userAddress;

  AddressModel? get userAddress => _userAddress;

  setPickModel(PickupModel? pickModel) {
    _pickupModel = pickModel;
  }

  setUserAddress(AddressModel? userAddress) {
    _userAddress = userAddress;
  }

  List<AddressModel> userAddressList = [];
  List<PaymentTypesModel> paymentTypes = [];
  List<GetCartListModel> cartList = [];
  List<StateByCountryModel> stateByCountries = [];
  List<CityByStateModel> cityByStates = [];
  StateByCountryModel? _stateByCountryModel;

  StateByCountryModel? get stateByCountry => _stateByCountryModel;
  CityByStateModel? _cityByState;

  CityByStateModel? get cityByState => _cityByState;

  onSelectState(StateByCountryModel? stateByCountryModel) async {
    _stateByCountryModel = stateByCountryModel;
    _cityByState = null;

    emit(GetPickupPointLoadingState());
    if (_stateByCountryModel != null) {
      await getCityByState(_stateByCountryModel?.id);
    }
  }

  onSelectCityByState(CityByStateModel? cityByStateModel) {
    _cityByState = cityByStateModel;

    emit(GetPickupPointLoadingState());
  }

  getPickupList() async {
    emit(GetPickupPointLoadingState());
    final result = await _orderRepo.getPickupPoints();
    result.fold((l) {
      final allPickupPoints = l.data["data"];
      if (allPickupPoints != null) {
        pickupList = allPickupPoints
            .map<PickupModel>((e) => PickupModel.fromJson(e))
            .toList();
      }
      print(pickupList.toString());
      emit(GetPickupPointSuccessState());
    }, (r) => emit(GetPickupPointErrorState()));
  }

  getPaymentTypes() async {
    emit(GetPaymentMethodLoadingState());
    final result = await _orderRepo.getPaymentTypes();
    result.fold((l) {
      final allPaymentTypes = l;
      if (allPaymentTypes != null) {
        paymentTypes = allPaymentTypes
            .map<PaymentTypesModel>((e) => PaymentTypesModel.fromJson(e))
            .toList();
      }
      print(paymentTypes.toString());
      emit(GetPaymentMethodSuccessState());
    }, (r) => emit(GetPaymentMethodErrorState()));
  }

  CartSummaryModel? cartSummary;

  getCartSummary() async {
    emit(GetCartSummaryLoadingState());
    final result = await _orderRepo.getCartSummary();
    result.fold((l) {
      cartSummary = CartSummaryModel.fromJson(l);
      emit(GetCartSummarySuccessState());
    }, (r) => emit(GetCartSummaryErrorState()));
  }

  ApplyCouponModel? applyCouponModel;

  applyCoupon(String couponCode) async {
    emit(ApplyCouponLoadingState());
    final result = await _orderRepo.applyCoupon(couponCode);
    result.fold((l) {
      // applyCouponModel = ApplyCouponModel.fromJson(l);
      emit(ApplyCouponSuccessState());
    }, (r) => emit(ApplyCouponErrorState()));
  }

  removeCoupon() async {
    emit(RemoveCouponLoadingState());
    final result = await _orderRepo.removeCoupon();
    result.fold((l) {
      emit(RemoveCouponSuccessState());
    }, (r) => emit(RemoveCouponErrorState()));
  }

  getUserAddressList() async {
    emit(GetUserAddressLoadingState());
    final result = await _orderRepo.getUserAddress();
    result.fold((l) {
      final allUserAddress = l.data["data"];
      if (allUserAddress != null) {
        userAddressList = allUserAddress
            .map<AddressModel>((e) => AddressModel.fromJson(e))
            .toList();
      }
      print(userAddressList.toString());
      emit(GetUserAddressSuccessState());
    }, (r) => emit(GetUserAddressErrorState()));
  }

  createUserAddress(int userId, String address, int stateId,
      int cityId, String? postalCode, String? phone) async {
    emit(CreateUserAddressLoadingState());
    final result = await _orderRepo.createUserAddress(
        userId, address, 64, stateId, cityId, postalCode, phone);
    result.fold((l) {
      // final allUserAddress = l.data["data"];
      // if (allUserAddress != null) {
      //   userAddressList = allUserAddress
      //       .map<AddressModel>((e) => AddressModel.fromJson(e))
      //       .toList();
      // }
      getUserAddressList();
      emit(CreateUserAddressSuccessState());
    }, (r) => emit(CreateUserAddressErrorState()));
  }

  onSelectPickLocation(PickupModel? pickupModel) async {
    _pickupModel = pickupModel;
    print(_pickupModel?.id.toString());
    emit(GetUserAddressLoadingState());
  }

  updateShippingTypeInCart(int? shippingId, String? shippingType) async {
    emit(UpdateShippingTypeInCartLoadingState());
    final result =
        await _orderRepo.updateShippingTypeInCart(shippingId, shippingType);
    result.fold((l) {
      // final shippingTypes = l.data["data"];
      // if (shippingTypes != null) {
      //   cartList = shippingTypes
      //       .map<AddCartModel>((e) => AddCartModel.fromJson(e))
      //       .toList();
      // }
      emit(UpdateShippingTypeInCartSuccessState());
    }, (r) => emit(UpdateShippingTypeInCartErrorState()));
  }

  updatePickupDateInCart(DateTime date) async {
    emit(UpdateOrderDateInCartLoadingState());
    final result = await _orderRepo.updatePickupDateInCart(date);
    result.fold((l) {
      // final shippingTypes = l.data["data"];
      // if (shippingTypes != null) {
      //   cartList = shippingTypes
      //       .map<AddCartModel>((e) => AddCartModel.fromJson(e))
      //       .toList();
      // }
      emit(UpdateOrderDateInCartSuccessState());
    }, (r) => emit(UpdateOrderDateInCartErrorState()));
  }

  getStateByCountry() async {
    emit(GetStateByCountryLoadingState());
    final result = await _orderRepo.getStateByCountry();
    result.fold((l) {
      final getStateByCountry = l.data["data"];
      if (getStateByCountry != null) {
        stateByCountries = getStateByCountry
            .map<StateByCountryModel>((e) => StateByCountryModel.fromJson(e))
            .toList();
      }
      emit(GetStateByCountrySuccessState());
    }, (r) => emit(GetStateByCountryErrorState()));
  }

  getCityByState(int? stateId) async {
    emit(GetPickupPointLoadingState());
    final result = await _orderRepo.getCityByState(stateId);
    result.fold((l) {
      final getCityByState = l.data["data"];
      if (getCityByState != null) {
        cityByStates = getCityByState
            .map<CityByStateModel>((e) => CityByStateModel.fromJson(e))
            .toList();
      }
      emit(GetPickupPointSuccessState());
    }, (r) => emit(GetPickupPointErrorState()));
  }
}
