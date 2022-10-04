import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserGetxController extends GetxController{
  String currentName = SharedPrefController().getValueFor<String>(PrefKeys.name.name) !;
  String currentCityId = SharedPrefController().getValueFor<String>(PrefKeys.city_id.name)!;
  String currentGender = SharedPrefController().getValueFor<String>(PrefKeys.gender.name)!;
  RxString name =''.obs;
  RxString cityId =''.obs;
  RxString gender =''.obs;


  static UserGetxController get to => Get.find<UserGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    name.value =currentName;
    cityId.value =currentCityId;
    gender.value =currentGender;
    super.onInit();
  }
  void updateUser({required String newName ,required String newCitId ,required String newGender }){
    name.value=newName ;
    cityId.value=newCitId ;
    gender.value=newGender ;
    SharedPrefController().saveChangeProfile(name: name.value, city_id: cityId.value, gender: gender.value);
    update();
  }

}