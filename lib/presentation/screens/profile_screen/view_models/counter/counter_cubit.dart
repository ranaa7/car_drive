import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/repositories/counter_repo/counter_repo.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/data/models/profile_counter_model.dart';



part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileCountersResponse profileCountersResponse = ProfileCountersResponse();
Map<String , ProfileCountersResponse>? data;


int cartItem =0;
int wishlistItem =0;
int orderCount =0;

  getProfileCount()async{
    emit(CounterLoading());
    final result = await ProfileCounterRepo().getProfileCount();
    result.fold((l) {
      print(l['cart_item_count']);
      if (l['cart_item_count']!=0) {
        cartItem = l['cart_item_count'];
      }
      if (l['wishlist_item_count']!=0) {
         wishlistItem = l['wishlist_item_count'];
      }
      if (l['order_count']!=0) {
        orderCount = l['order_count'];
      }
      emit(CounterSuccess());
    }, (r) => emit(CounterFailure(r.toString())));
  }

}
