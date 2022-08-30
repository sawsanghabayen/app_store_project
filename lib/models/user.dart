class User {
  late int id;
  late String name;
  late String email;
  late String password;
  static const tableName='users';


  User();
  //fromMap كل صف في الداتا بيز عبارة عن ماب ورح نعمل تحويل ل object User من خلال الكونستركتر
  User.fromMap(Map<String,dynamic> rowMap){    /*  هنا عملية Read*/
    id = rowMap['id']; /*هنا  id في  rowMap['id']  لازم تكون نفس اسم الجدول في الداتا بيز*/
    name = rowMap['name'];
    email = rowMap['email'];
    password = rowMap['password'];
  }

  // هلا عملية الاضافة
  Map<String , dynamic> toMap(){
    Map<String,dynamic> map =<String,dynamic>{};
    map['name']=name;
    map['email']=email;
    map['password']=password;
    return map;


  }

}