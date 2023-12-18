part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterLoading extends CounterInitial {}
class CounterSuccess extends CounterInitial {
  final ProfileCountersResponse profileCountersResponse;

  CounterSuccess(this.profileCountersResponse);
}
class CounterFailure extends CounterInitial {
  final String errMessage;

  CounterFailure(this.errMessage);
}

