class WalletHistoryModel {
  String? amount;
  String? paymentMethod;
  String? approvalString;
  String? date;

  WalletHistoryModel(
      {this.amount, this.paymentMethod, this.approvalString, this.date});

  WalletHistoryModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    paymentMethod = json['payment_method'];
    approvalString = json['approval_string'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['payment_method'] = paymentMethod;
    data['approval_string'] = approvalString;
    data['date'] = date;
    return data;
  }
}
