import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:more_2_drive/domain/models/clubpoints_model/clubpoints_model.dart';
import 'package:more_2_drive/domain/models/wallet_model/wallet_history_model.dart';

import '../../../domain/repositories/clubpoints_repo/clubpoints_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {

  final WalletRepo walletRepo;

  List<ClubpointsModel> clubpoints =[];

  List<WalletHistoryModel> wallethistory =[];

  String balance ="";
  String recharged ="";


  static WalletCubit get(context, {bool listen = false}) =>
      BlocProvider.of<WalletCubit>(context, listen: listen);
  WalletCubit(this.walletRepo) : super(InitState());


  getClubpoints(int? page) async {
    if (page==1) {
      emit(clubpointsLoadingState());
    }

    final result = await walletRepo.getClubpoints(page);

    if (page == 1) {
      clubpoints.clear();
    }
    result.fold((l) {
      final getClubpoints = l.data["data"];
      if (getClubpoints != null) {
        clubpoints = getClubpoints
            .map<ClubpointsModel>((e) => ClubpointsModel.fromJson(e))
            .toList();
      }
      print(clubpoints.toString());
      emit(clubpointsSuccessState());
    }, (r) => emit(clubpointsErrorState()));
  }



  addClubpointsToWallet(int productId) async {
    emit(clubpointsToWalletLoadingState());
    final result = await walletRepo.addClubpointsToWallet(productId);
    result.fold((l) {
      emit(clubpointsToWalletSuccessState());
    }, (r) => emit(clubpointsToWalletErrorState()));
  }



  getWalletHistory(int? page) async {
    if (page==1) {
      emit(walletHistoryLoadingState());
    }

    final result = await walletRepo.getWalletHistory(page);

    if (page == 1) {
      wallethistory.clear();
    }
    result.fold((l) {
      final getWallet = l.data["data"];
      if (getWallet != null) {
        wallethistory = getWallet
            .map<WalletHistoryModel>((e) => WalletHistoryModel.fromJson(e))
            .toList();
      }
      print(wallethistory.toString());
      emit(walletHistorySuccessState());
    }, (r) => emit(walletHistoryErrorState()));
  }


  getWalletBalance()async{
    emit(walletBalanceLoadingState());
    final result = await walletRepo.getWalletBalance();
    result.fold((l) {
      print(l['balance']);
      if (l['balance']!= null) {
        balance = l['balance'];
      }
      if (l['last_recharged']!= null) {
        recharged = l['last_recharged'];
      }
      emit(walletBalanceSuccessState());
    }, (r) => emit(walletBalanceErrorState()));
  }


}
