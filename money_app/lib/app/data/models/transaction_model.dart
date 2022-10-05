class Transaction {
  String? id;
  String? type;
  double? amount;
  String? name;
  DateTime? createdAt;

  Transaction({this.id, this.type, this.amount, this.name, this.createdAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    name = json['name'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['amount'] = amount;
    data['name'] = name;
    data['createdAt'] = createdAt;
    return data;
  }
}
