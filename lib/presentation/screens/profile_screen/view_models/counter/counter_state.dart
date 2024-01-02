part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterLoading extends CounterInitial {}
class CounterSuccess extends CounterInitial {

}
class CounterFailure extends CounterInitial {
  final String errMessage;

  CounterFailure(this.errMessage);
}

