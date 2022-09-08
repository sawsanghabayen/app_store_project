class Order {
  int? id;
  String? total;
  String? date;
  String? paymentType;
  String? status;
  String? storeId;
  String? userId;
  String? addressId;
  Null? paymentCardId;
  String? orderProductsCount;

  Order(
      {this.id,
        this.total,
        this.date,
        this.paymentType,
        this.status,
        this.storeId,
        this.userId,
        this.addressId,
        this.paymentCardId,
        this.orderProductsCount});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    orderProductsCount = json['order_products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['date'] = this.date;
    data['payment_type'] = this.paymentType;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['payment_card_id'] = this.paymentCardId;
    data['order_products_count'] = this.orderProductsCount;
    return data;
  }
}