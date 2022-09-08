import 'dart:convert';

import 'package:database_app/api/controllers/order_api_controller.dart';
import 'package:database_app/getx/cart_getx_controller.dart';
import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/models/product.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../database/controllers/cart_db_controller.dart';
import '../models/cart.dart';
import '../models/order.dart';
import '../models/order_details.dart';
import '../models/process_response.dart';

class OrderGetxController extends GetxController {
  final CartGetxController cartGetxController = Get.put(CartGetxController());

  // RxList<Cart> cartItems = <Cart>[].obs;
  List<Map<String, dynamic>> list = [];
  RxList<Order> orders = <Order>[].obs;
  RxList<Product> products = <Product>[].obs;
  Rx<OrderDetails?> orderDetails = OrderDetails().obs;

  // RxList<OrderDetails?> orderDetails = <OrderDetails>[].obs;
  RxBool loading = false.obs;


  static OrderGetxController get to => Get.find<OrderGetxController>();

  @override
  void onInit() {
    getOrders();
    super.onInit();
  } // List<Product> products = <Product>[];

  OrderApiController orderApiController = OrderApiController();
  // OrderApiController orderDetailsApiController = OrderApiController();

  Future<ProcessResponse> create(
      List<Cart> carts, String paymentType, int addressId) async {
    list.clear();
    carts.forEach((element) {
      list.add(element.toMapForApi());
    });
    ProcessResponse processResponse = await orderApiController.createOrder(
        cartItems: list, paymentType: paymentType, addressId: addressId);
    return getResponse(processResponse.success, message: processResponse.message);
  }
  Future<void> getOrders() async {
    loading.value = true;
    orders.value = await orderApiController.getAllOrders();
    loading.value = false;
    update();
  }

  Future<OrderDetails?> getOrderDetails({required int id}) async {
    loading.value = true;
    orderDetails.value = await orderApiController.getOrderDetails(id: id);
    loading.value = false;
    update();
    return orderDetails.value;
  }


  ProcessResponse getResponse(bool success,
      {String message = 'Operation completed successfully'}) {
    return ProcessResponse(
      message: message,
      success: success,
    );
    // }
  }
}
