import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:more_2_drive/core/app_constants/constants.dart';
import 'package:more_2_drive/domain/repositories/counter_repo/counter_repo.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/data/models/profile_counter_model.dart';

import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../utils/strings/end_points.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileCountersResponse profileCountersResponse = ProfileCountersResponse();
Map<String , ProfileCountersResponse>? data;
  // Future<void>  getCounters() async{
  //   emit(CounterLoading());
  //   try {
  //
  //     var response = await DioHelper.getData(endPoint: EndPoints.counters , token: token);
  //     print("profile counter before");
  //     if (response.data != null) {
  //      profileCountersResponse = response.data;
  //       emit(CounterSuccess(profileCountersResponse));
  //       print("counter after");
  //     }
  //     else {
  //       print("40");
  //       emit(CounterFailure("Response data is null."));
  //       print("42");
  //     }
  //
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //     print("48");
  //   }
  //
  // }

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
