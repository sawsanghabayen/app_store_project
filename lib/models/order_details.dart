import 'package:database_app/models/product.dart';

import 'address.dart';

class OrderDetails {
  int? id;
  String? total;
  String? date;
  String? paymentType;
  String? status;
  String? storeId;
  String? userId;
  String? addressId;
  Null? paymentCardId;
  String? productsCount;
  List<Product>? products;
  Address? address;

  OrderDetails(
      {this.id,
        this.total,
        this.date,
        this.paymentType,
        this.status,
        this.storeId,
        this.userId,
        this.addressId,
        this.paymentCardId,
        this.productsCount,
        this.products,
        this.address});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
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
    data['products_count'] = this.productsCount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

// class Products {
//   int? id;
//   String? nameEn;
//   String? nameAr;
//   String? infoEn;
//   String? infoAr;
//   String? price;
//   String? quantity;
//   String? overalRate;
//   String? subCategoryId;
//   String? orderQuantity;
//   int? productRate;
//   Null? offerPrice;
//   bool? isFavorite;
//   String? imageUrl;
//   Pivot? pivot;
//
//   Products(
//       {this.id,
//         this.nameEn,
//         this.nameAr,
//         this.infoEn,
//         this.infoAr,
//         this.price,
//         this.quantity,
//         this.overalRate,
//         this.subCategoryId,
//         this.orderQuantity,
//         this.productRate,
//         this.offerPrice,
//         this.isFavorite,
//         this.imageUrl,
//         this.pivot});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameEn = json['name_en'];
//     nameAr = json['name_ar'];
//     infoEn = json['info_en'];
//     infoAr = json['info_ar'];
//     price = json['price'];
//     quantity = json['quantity'];
//     overalRate = json['overal_rate'];
//     subCategoryId = json['sub_category_id'];
//     orderQuantity = json['order_quantity'];
//     productRate = json['product_rate'];
//     offerPrice = json['offer_price'];
//     isFavorite = json['is_favorite'];
//     imageUrl = json['image_url'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_en'] = this.nameEn;
//     data['name_ar'] = this.nameAr;
//     data['info_en'] = this.infoEn;
//     data['info_ar'] = this.infoAr;
//     data['price'] = this.price;
//     data['quantity'] = this.quantity;
//     data['overal_rate'] = this.overalRate;
//     data['sub_category_id'] = this.subCategoryId;
//     data['order_quantity'] = this.orderQuantity;
//     data['product_rate'] = this.productRate;
//     data['offer_price'] = this.offerPrice;
//     data['is_favorite'] = this.isFavorite;
//     data['image_url'] = this.imageUrl;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     return data;
//   }
// }

// class Pivot {
//   String? orderId;
//   String? productId;
//
//   Pivot({this.orderId, this.productId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     orderId = json['order_id'];
//     productId = json['product_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order_id'] = this.orderId;
//     data['product_id'] = this.productId;
//     return data;
//   }
// }


