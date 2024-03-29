part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}




class SocialLoginLoadingState extends LoginState {}

class SocialLoginSuccessState extends LoginState {

  final LoginModel loginModel;

  SocialLoginSuccessState(this.loginModel);
}

class SocialLoginFailureState extends LoginState {
  final String errMessage;

  SocialLoginFailureState({required this.errMessage});
}

class LogoutLoadingState extends LoginState {}

class LogoutSuccessState extends LoginState {}

class LogoutFailureState extends LoginState {
  final String errMessage;
  LogoutFailureState({required this.errMessage});
}





