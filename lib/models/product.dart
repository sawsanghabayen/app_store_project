class Product {
  int? id;
  String? nameEn;
  String? nameAr;
  String? infoEn;
  String? infoAr;
  String? price;
  String? quantity;
  String? overalRate;
  String? subCategoryId;
  int? productRate;
  String? offerPrice;
  bool? isFavorite;
  String? imageUrl;
  String? orderQuantity;

  Product(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.infoEn,
        this.infoAr,
        this.price,
        this.quantity,
        this.overalRate,
        this.subCategoryId,
        this.productRate,
        this.offerPrice,
        this.isFavorite,
        this.orderQuantity,

        this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    orderQuantity = json['order_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['info_en'] = this.infoEn;
    data['info_ar'] = this.infoAr;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['overal_rate'] = this.overalRate;
    data['sub_category_id'] = this.subCategoryId;
    data['product_rate'] = this.productRate;
    data['offer_price'] = this.offerPrice;
    data['is_favorite'] = this.isFavorite;
    data['image_url'] = this.imageUrl;
    data['order_quantity'] = this.orderQuantity;
    return data;
  }
}