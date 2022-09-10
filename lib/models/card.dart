class Payment {
  int? id;
  String? type;
  String? holderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.id,
        this.type,
        this.holderName,
        this.cardNumber,
        this.expDate,
        this.cvv,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['holder_name'] = this.holderName;
    data['card_number'] = this.cardNumber;
    data['exp_date'] = this.expDate;
    data['cvv'] = this.cvv;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}