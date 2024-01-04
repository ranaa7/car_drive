part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoadingState extends SignupInitial{}
class SignupSuccessState extends SignupInitial{
  final SignupModel signupModel;

  SignupSuccessState(this.signupModel);
}
class SignupFailureState extends SignupInitial{
  final String errMessage;

  SignupFailureState({required this.errMessage});
}


