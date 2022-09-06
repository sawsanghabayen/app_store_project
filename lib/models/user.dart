/*
class User {
  late int id;
  late String name;
  late String email;
  late String password;
  static const tableName='users';


  User();
  //fromMap كل صف في الداتا بيز عبارة عن ماب ورح نعمل تحويل ل object User من خلال الكونستركتر
  User.fromMap(Map<String,dynamic> rowMap){    */
/*  هنا عملية Read*//*

    id = rowMap['id']; */
/*هنا  id في  rowMap['id']  لازم تكون نفس اسم الجدول في الداتا بيز*//*

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

}*/



import 'city.dart';

class User {
 late int  _id;
 late String  _name;
  String?  _email;
 late String  _password;
 late String  _mobile;
 late String  _gender;
 late bool  _active;
 late bool  _verified;
 late String  _cityId;
 late String  _storeId;
      String?  _fcmToken;
 late String  _token;
 late String  _tokenType;
 late String  _refreshToken;
 late City  _city;

  User() ;
 int? get id => _id;
 set id(int? id) => _id = id!;
 String? get name => _name;
 set name(String? name) => _name = name!;
 String? get email => _email;
 set email(String? email) => _email = email;
 String? get password => _password;
 set password(String? password) => _password = password!;
 String? get mobile => _mobile;
 set mobile(String? mobile) => _mobile = mobile!;
 String? get gender => _gender;
 set gender(String? gender) => _gender = gender!;
 bool? get active => _active;
 set active(bool? active) => _active = active!;
 bool? get verified => _verified;
 set verified(bool? verified) => _verified = verified!;
 String? get cityId => _cityId;
 set cityId(String? cityId) => _cityId = cityId!;
 String? get storeId => _storeId;
 set storeId(String? storeId) => _storeId = storeId!;
 String? get fcmToken => _fcmToken!;
 set fcmToken(String? fcmToken) => _fcmToken = fcmToken;
 String? get token => _token;
 set token(String? token) => _token = token!;
 String? get tokenType => _tokenType;
 set tokenType(String? tokenType) => _tokenType = tokenType!;
 String? get refreshToken => _refreshToken;
 set refreshToken(String? refreshToken) => _refreshToken = refreshToken!;
 City? get city => _city;
 set city(City? city) => _city = city!;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _gender = json['gender'];
    _active = json['active'];
    _verified = json['verified'];
    _cityId = json['city_id'];
    _storeId = json['store_id'];
    _fcmToken = json['fcm_token'];
    _token = json['token'];
    _tokenType = json['token_type'];
    _refreshToken = json['refresh_token'];
    _city = ((json['city'] != null) ?  City.fromJson(json['city']) : null)!;
  }

}

