
import 'package:get/get.dart';

import '../api/controllers/users_api_controller.dart';
import '../models/home.dart';

class HomeGetxController extends GetxController {
  Home? home;
  RxBool isLoading = false.obs;
  UsersApiController userApiController = UsersApiController();

  static HomeGetxController get to => Get.find();

  @override
  void onInit() {
    getHome();
    super.onInit();
  }


  Future<void> getHome() async {
    isLoading.value = true;
    home = await userApiController.getHome();
    isLoading.value = false;
    update();
  }

}