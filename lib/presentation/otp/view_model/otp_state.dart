part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpLoading extends OtpInitial {}
class OtpSuccess extends OtpInitial {

  final otpModel otpmodel;
  OtpSuccess(this.otpmodel);
}
class OtpFailure extends OtpInitial {


  final String errMessage;

  OtpFailure({required this.errMessage});
}
