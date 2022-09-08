import 'package:get/get.dart';

import '../api/controllers/address_api_controller.dart';
import '../models/address.dart';
import '../models/city.dart';
import '../models/process_response.dart';

class AddressGetxController extends GetxController {

  AddressApiController addressApiController = AddressApiController();
  RxList<Address> addresses = <Address>[].obs;
  RxList<City> cities = <City>[].obs;
  RxBool loading = false.obs;

  static AddressGetxController get to => Get.find<AddressGetxController>();

  void onInit() {
    getCities();
    getAddresses();
    super.onInit();
  }
  Future<ProcessResponse> createAddress(String name,
      String info,
      String contactNumber,
      int city_id,) async {
    ProcessResponse processResponse = await addressApiController
        .createAddress(name:name ,cityId: city_id ,contactNumber: contactNumber ,info: info );
    // update();
    return getResponse(
        processResponse.success, message: processResponse.message);
  }

  Future<void> getAddresses() async {
    loading.value = true;
    addresses.value = await addressApiController.getAddresses();
    loading.value = false;
    update();
  }

  Future<void> getCities() async {
    loading.value = true;
    cities.value = await addressApiController.getCities();
    loading.value = false;
    update();
  }
  // Address getAddress() {
  //   Address address = Address();
  //   address.name =
  //   cart.price = product.price as double;
  //   cart.total = product.price as double;
  //   cart.userId = int.parse(SharedPrefController().getValueFor<String>(PrefKeys.id.name)!);
  //   cart.count = 1;
  //   cart.productName = product.nameEn;
  //   cart.productImage = product.imageUrl;
  //
  //   return cart;
  // }

  Future<ProcessResponse> deleteAddress(int index) async {
    loading = true.obs;
    // Address address = addresses[index];
    ProcessResponse processResponse = await addressApiController.deleteAddress(id: index);

    loading.value = false;
    update();
    return processResponse;

  }

  ProcessResponse getResponse(bool success,
      {String message = 'Operation completed successfully'}) {
    return ProcessResponse(
      message: message,
      success: success,
    );
  }
}