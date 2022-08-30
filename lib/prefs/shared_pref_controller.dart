import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
enum PrefKeys {language ,email ,name, loggedIn}
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
  void save({required User user}){
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setString(PrefKeys.email.name, user.email);
    _sharedPreferences.setString(PrefKeys.name.name, user.name);

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
  _sharedPreferences.clear();
  }

}