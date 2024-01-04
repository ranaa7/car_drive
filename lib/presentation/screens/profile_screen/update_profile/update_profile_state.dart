part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoading extends UpdateProfileInitial {}
class UpdateProfileSuccess extends UpdateProfileInitial {
 final UpdateProfileModel updateProfileModel;

 UpdateProfileSuccess(this.updateProfileModel);
}
class UpdateProfileFailure extends UpdateProfileInitial {
  final String errMessage;

  UpdateProfileFailure(this.errMessage);
}
