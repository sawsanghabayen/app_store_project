import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String language = SharedPrefController().getValueFor<String>(PrefKeys.language.name) ?? 'en';
  void changeLanguage(){
    language=language =='en'? 'ar':'en';
    SharedPrefController().changeLanguage(langCode: language);
    notifyListeners();
  }
}