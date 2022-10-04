import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/controllers/product_api_controller.dart';
import '../models/process_response.dart';
import '../models/product.dart';
import '../models/product_details.dart';

class ProductGetxController extends GetxController {
  final ProductApiController productApiController = ProductApiController();
  RxList<Product> products = <Product>[].obs;
  RxList<Product> favoriteProducts = <Product>[].obs;
  Rx<ProductDetails?> productDetails = ProductDetails().obs;
  RxBool loading = false.obs;
  RxBool isFav = false.obs;

  void onInit() {
    getFavoriteProducts();
    super.onInit();

  }

  static ProductGetxController get to => Get.find();

  Future<void> getProducts({required int id}) async {
    loading.value = true;
    products.value = await productApiController.getProducts(id: id);
    loading.value = false;
    update();
  }

  Future<void> getFavoriteProducts() async {
    loading.value = true;
    favoriteProducts.value = await productApiController.getFavoriteProducts();
    loading.value =false;
  }


  Future<ProductDetails?> getProductDetails({required int id}) async {
    loading.value = true;
    productDetails.value = await productApiController.getProductDetails(id: id);
    loading.value = false;


    // productDetails.refresh();
    // products.refresh();
    // favoriteProducts.refresh();
    update();
    return productDetails.value;
  }
  //
  Future<void> addFavoriteProducts({required Product product}) async {
    // update();
    ProcessResponse processResponse = await productApiController.addFavoriteProducts(id: product.id);
    if(processResponse.success){
      int index = favoriteProducts.indexWhere((element) => element.id == product.id);
      if(index != -1) {
        favoriteProducts.removeAt(index);
        product.isFavorite = false;
        // favoriteProducts.refresh();
        // products.value.map((e) => null)
      } else {
        favoriteProducts.add(product);
        product.isFavorite = true;
      }
        favoriteProducts.refresh();
    }

    // productDetails.refresh();
    // favoriteProducts.refresh();
    // update();
  }
  //
  // Future<void> rattingProduct({required ProductDetails product,required BuildContext context,required double rate}) async {
  //   await productApiController.productRate(context, id: product.id,ratting: rate);
  //   productDetails.refresh();
  //   products.refresh();
  //   favoriteProducts.refresh();
  //   update();
  // }
}