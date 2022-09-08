import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../database/controllers/cart_db_controller.dart';
import '../models/cart.dart';
import '../models/process_response.dart';

class CartGetxController extends GetxController {
  RxList<Cart> cartItems = <Cart>[].obs;
  RxBool loading = false.obs;

  static CartGetxController get to => Get.find<CartGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  } // List<Product> products = <Product>[];



  final CartDbController _dbController = CartDbController();

  final ProductGetxController productGetxController = ProductGetxController();

  double total = 0;
  double quantity = 0;

  Future<ProcessResponse> create(Cart cart) async {
    int index =
    cartItems.indexWhere((element) => element.productId == cart.productId);
    if (index == -1) {
      int newRowId = await _dbController.create(cart);
      if (newRowId != 0) {
        total += cart.total;
        quantity += 1;
        cart.id = newRowId;
        cartItems.add(cart);
      }
      return getResponse(newRowId != 0);
    } else {
      int newCount = cartItems[index].count + 1;
      return changeQuantity(index, newCount);
    }
  }
  Future<ProcessResponse> deleteItem(int index) async {
    // loading = true.obs;
    Cart cart = cartItems[index];
    bool deleted = await _dbController.delete(cart.id);
    print(deleted);
    if (deleted) {
      total -= cart.total;
      quantity -= 1;
      cartItems.removeAt(index);
    }
    return getResponse(deleted);

  }

  void read() async {
    loading.value = true;
    cartItems.value = await _dbController.read();
    for (Cart cart in cartItems) {
      total += cart.total;
      quantity += cart.count;
    }
    loading.value = false;
  }

  Future<ProcessResponse> changeQuantity(int index, int count) async {
    bool isDelete = count == 0;
    Cart cart = cartItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.id)
        : await _dbController.update(cart);

    if (result) {
      if (isDelete) {
        total -= cart.total;
        quantity -= 1;
        cartItems.removeAt(index);
      } else {
        cart.count = count;
        cart.total = cart.price * cart.count;
        print(cart.total);
        total = cart.total;
        quantity += 1;
        cartItems[index] = cart;
      }
    }

    return getResponse(result,message: SharedPrefController().getValueFor<String>(PrefKeys.language.name)=='en'? 'Product has been increased successfully':'تمت الزيادة بنجاح');
  }

  Future<ProcessResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      total = 0;
      quantity = 0;
      cartItems.clear();
    }
    return getResponse(cleared);
  }


  double getTotla(){
    double total=0.0;
    for(Cart cart in cartItems.value){
      total+=cart.total;
    }
    return total;
  }

  ProcessResponse getResponse(bool success,{ String message='Operation completed successfully'}) {
    return ProcessResponse(
      message:message,
      success: success,
    );
  }
}