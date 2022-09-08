class Cart {
  late int id;
  late double total;
  late int count;
  late double price;
  late int userId;
  late int productId;
  late String productName;
  late String productImage;
  static const tableName='cart';


  Cart();
  Cart.fromMap(Map<String,dynamic> rowMap){
    id=rowMap['id'];
    total=rowMap['total'];
    count=rowMap['count'];
    price=rowMap['price'];
    userId=rowMap['user_id'];
    productId=rowMap['product_id'];
    productName=rowMap['product_name'];
    productImage=rowMap['product_image'];

  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic>map=<String,dynamic>{};
    map['total']=total;
    map['count']=count;
    map['price']=price;
    map['user_id']=userId;
    map['product_id']=productId;
    map['product_name']=productName;
    map['product_image']=productImage;
    return map;

  }







}