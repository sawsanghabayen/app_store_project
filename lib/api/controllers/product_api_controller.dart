import 'dart:convert';
import 'dart:io';

import 'package:database_app/utils/helpers.dart';

import '../../models/process_response.dart';
import '../../models/product.dart';
import 'package:http/http.dart' as http;

import '../../models/product_details.dart';
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

  Future<ProductDetails?> getProductDetails({required int id}) async {
    var response = await http.get(Uri.parse(ApiSettings.detailsproducts+'/$id'),headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      ProductDetails productdetails = ProductDetails.fromJson(jsonDecode(response.body)['object']);
      return productdetails;
    }
    return null;
  }

  Future<List<Product>> getFavoriteProducts() async {
    var response = await http.get(Uri.parse(ApiSettings.favoriteproducts),headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(jsonDecode(response.body)['list']);
      List data=jsonDecode(response.body)['list'];
      return data.map((e) => Product.fromJson(e),).toList();
    }
    return [];
  }
  //
  //
  //
  //
  //
  Future<ProcessResponse> addFavoriteProducts({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.favoriteproducts);
    var response = await http.post(uri, body: {
      'product_id': id.toString()
    },
      headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      }
    );
    // print(response.body);

      if (response.statusCode == 200 || response.statusCode == 400) {
        var json = jsonDecode(response.body);
        return ProcessResponse(message: json['message'], success: json['status']);
      }

      return errorResponse;


  }}

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
