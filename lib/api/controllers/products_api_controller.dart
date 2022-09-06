import 'dart:convert';
import 'dart:io';

import 'package:database_app/utils/helpers.dart';

import '../../models/product.dart';
import 'package:http/http.dart' as http;

import '../../prefs/shared_pref_controller.dart';
import '../api_settings.dart';


class ProductApiController with Helpers{

  Future<List<Product>> getProducts({required int id}) async {
    var response = await http.get(Uri.parse(ApiSettings.products+'/$id'),headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    }
    return [];
  }

  // Future<List<ProductDetails>> getFavoriteProducts() async {
  //   var response = await http.get(getUrl(ApiSettings.FAVORITE_PRODUCT),headers: {
  //     'Accept':'application/json',
  //     HttpHeaders.authorizationHeader: SharedPreferencesController().token,
  //     'X-Requested-With': 'XMLHttpRequest',
  //   });
  //   if (isSuccessRequest(response.statusCode)) {
  //     var data = jsonDecode(response.body)['list'] as List;
  //     List<ProductDetails> favoriteProducts = data.map((e) => ProductDetails.fromJson(e)).toList();
  //     return favoriteProducts;
  //   }
  //   return [];
  // }
  //
  //
  //
  // Future<ProductDetails?> getProductDetails({required int id}) async {
  //   var response = await http.get(
  //       getUrl(ApiSettings.PRODUCT_DETAILS +'/$id'),
  //       headers: {
  //         HttpHeaders.authorizationHeader: SharedPreferencesController().token,
  //         'X-Requested-With': 'XMLHttpRequest',
  //         'lang': SharedPreferencesController().languageCode,
  //       });
  //   if (isSuccessRequest(response.statusCode)) {
  //     var data = jsonDecode(response.body)['object'];
  //     var productDetails = ProductDetails.fromJson(data);
  //     return productDetails;
  //   }
  // }
  //
  // Future<bool> addFavoriteProducts(BuildContext context, {required int id}) async {
  //   var response = await http.post(
  //       getUrl(ApiSettings.FAVORITE_PRODUCT),
  //       body: {'product_id': id.toString()},
  //       headers: requestHeaders
  //   );
  //   if (isSuccessRequest(response.statusCode)) {
  //     showMessage(context, response);
  //     return true;
  //   } else if (response.statusCode != 500) {
  //     showMessage(context, response, error: true);
  //   }else{
  //     handleServerError(context);
  //   }
  //   return false;
  // }
  //
  //
  // Future<bool> productRate(BuildContext context, {required int id,required double ratting}) async {
  //   var response = await http.post(
  //       getUrl(ApiSettings.RATTING_PRODUCT),
  //       body: {'product_id': id.toString(), 'rate' :ratting.toString()},
  //       headers: requestHeaders
  //   );
  //   if (isSuccessRequest(response.statusCode)) {
  //     showMessage(context, response);
  //     return true;
  //   } else if (response.statusCode != 500) {
  //     showMessage(context, response, error: true);
  //   }else{
  //     handleServerError(context);
  //   }
  //   return false;
  // }
}