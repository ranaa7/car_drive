import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:more_2_drive/core/app_constants/constants.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/data/models/profile_counter_model.dart';

import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../utils/strings/end_points.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileCountersResponse profileCountersResponse = ProfileCountersResponse();
Map<String , ProfileCountersResponse>? data;
  Future<void>  getCounters() async{
    emit(CounterLoading());
    try {

      var response = await DioHelper.getData(endPoint: EndPoints.counters , token: token);
      print("profile counter before");
      if (response.data != null) {
       profileCountersResponse = ProfileCountersResponse.fromJson(response.data);
        emit(CounterSuccess(profileCountersResponse));
        print("counter after");
      }
      else {
        print("40");
        emit(CounterFailure("Response data is null."));
        print("42");
      }

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      print("48");
    }

  }

}
