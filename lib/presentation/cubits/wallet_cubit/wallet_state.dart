part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class InitState extends WalletState{}
class clubpointsLoadingState extends WalletState{}
class clubpointsSuccessState extends WalletState{}
class clubpointsErrorState extends WalletState{}


class clubpointsToWalletLoadingState extends WalletState{}
class clubpointsToWalletSuccessState extends WalletState{}
class clubpointsToWalletErrorState extends WalletState{}


class walletHistoryLoadingState extends WalletState{}
class walletHistorySuccessState extends WalletState{}
class walletHistoryErrorState extends WalletState{}


class walletBalanceLoadingState extends WalletState{}
class walletBalanceSuccessState extends WalletState{}
class walletBalanceErrorState extends WalletState{}

