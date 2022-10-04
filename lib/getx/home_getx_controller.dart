
import 'package:get/get.dart';

import '../api/controllers/users_api_controller.dart';
import '../models/home.dart';

class HomeGetxController extends GetxController {
  Rx<Home> home =Home().obs;
  RxBool isLoading = false.obs;

  UsersApiController userApiController = UsersApiController();

  static HomeGetxController get to => Get.find<HomeGetxController>();

  @override
  void onInit() {
    getHome();
    super.onInit();
  }


 Future<void> getHome() async {
    isLoading.value = true;
    home.value = await userApiController.getHome();
    isLoading.value = false;
    update();
  }

}