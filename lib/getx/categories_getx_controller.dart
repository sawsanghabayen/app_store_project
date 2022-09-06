
import 'package:database_app/models/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/controllers/category_api_controller.dart';
import '../models/sub_category.dart';

class CategoryGetxController extends GetxController {
  final CategoryApiController categoryApiController = CategoryApiController();
  RxList<Categories> categories = <Categories>[].obs;
  RxList<SubCategory> subCategories = <SubCategory>[].obs;
  RxBool loading = false.obs;

  static CategoryGetxController get to => Get.find();

  void onInit() {
    getCategory();

    super.onInit();
  }

  Future<void> getCategory() async {
    loading.value = true;
    categories.value = await categoryApiController.getCategory();
    loading.value = false;
    update();
  }


  Future<void> getSubCategories({required int id}) async {
    loading.value = true;
    subCategories.value = await categoryApiController.getSubCategory(id: id);
    loading.value = false;
    update();
  }

}