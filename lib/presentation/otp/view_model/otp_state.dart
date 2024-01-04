part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpLoading extends OtpInitial {}
class OtpSuccess extends OtpInitial {

  final OtpModel otpmodel;
  OtpSuccess(this.otpmodel);
}
class OtpFailure extends OtpInitial {


  final String errMessage;

  OtpFailure({required this.errMessage});
}
class ResendLoading extends OtpInitial {}
class ResendSuccess extends OtpInitial {


  final ResendModel resendModel;
  ResendSuccess(this.resendModel);
}
class ResendFailure extends OtpInitial {


  final String errMessage;

  ResendFailure({required this.errMessage});
}
