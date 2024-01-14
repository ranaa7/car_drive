class WalletBalanceModel {
  String? balance;
  String? lastRecharged;

  WalletBalanceModel({this.balance, this.lastRecharged});

  WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    lastRecharged = json['last_recharged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['balance'] = balance;
    data['last_recharged'] = lastRecharged;
    return data;
  }
}