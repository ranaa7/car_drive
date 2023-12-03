part of 'phone_register_cubit.dart';

@immutable
abstract class PhoneRegisterState {}

class PhoneRegisterInitial extends PhoneRegisterState {}

class PhoneRegisterLoadingState extends PhoneRegisterState {}

class PhoneRegisterSuccessState extends PhoneRegisterState {
  final PhoneLoginModel phoneLoginModel;
  PhoneRegisterSuccessState(this.phoneLoginModel);
}

class PhoneRegisterFailureState extends PhoneRegisterState {
  final String errMessage;

  PhoneRegisterFailureState({required this.errMessage});
}
