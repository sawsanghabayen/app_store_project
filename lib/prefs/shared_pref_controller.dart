import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

enum PrefKeys {language ,id,mobile,gender,active,verified,email ,name, loggedIn,token ,city_id}
class SharedPrefController{
  SharedPrefController._();
  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController(){
    return _instance ??=SharedPrefController._();
  }

  Future<void>  initPreferences() async{
    _sharedPreferences= await SharedPreferences.getInstance();

  }
  void save(User user){
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setString(PrefKeys.email.name, user.email??'');
    _sharedPreferences.setString(PrefKeys.name.name, user.name!);
    _sharedPreferences.setString(PrefKeys.id.name, user.id.toString());
    _sharedPreferences.setString(PrefKeys.verified.name, user.verified.toString());
    _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token!}');
    _sharedPreferences.setString(PrefKeys.city_id.name, user.cityId!);
    _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile!);
    _sharedPreferences.setString(PrefKeys.gender.name, user.gender!);
    _sharedPreferences.setString(PrefKeys.active.name, user.active.toString());

  }
  void saveChangeProfile({required String name ,required String city_id ,required String gender }){
    _sharedPreferences.setString(PrefKeys.name.name, name!);
    _sharedPreferences.setString(PrefKeys.city_id.name, city_id!);
    _sharedPreferences.setString(PrefKeys.gender.name, gender!);

  }



  void changeLanguage({required String langCode}){
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }

  // String get language => _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';

  // بدل م نضل نكرر بميثودات ال get رح نستخدم هاي الميثود

  T?  getValueFor<T>(String key){

    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }
  //  هنا مسموح يرجع  bool في دالة بترجع <Future<bool بس لازم نحط async  من غير ال await الحالة الوحيدة

  Future<bool> removeValueFor(String key) async{
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.remove(key);
    }
    return false;
  }
//  طريقة تانية
  void clear(){
    for(String key in _sharedPreferences.getKeys()){
      if(key!=PrefKeys.language.name){
     _sharedPreferences.remove(key);
      }
    }
  }

}